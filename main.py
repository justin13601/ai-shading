import json
import os

import joblib
import numpy as np
import pandas as pd
import torch
from sklearn.preprocessing import MinMaxScaler

import torch
import torch.nn as nn


class CSVFileNotFound(Exception):

    def __init__(self, filename, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.filename = filename

    def __str__(self):
        return f'The path {self.filename} does not exist'


# TODO: what happens when that date does not exist
def reshape_data(df, start_date, end_date):
    if start_date and end_date:
        df = df.set_index('Date')[start_date:end_date]
    elif start_date:
        df = df.set_index('Date')[start_date:]
    elif end_date:
        df = df.set_index('Date')[:end_date]
    return df.index, df.loc[:, 'GHI'].values.reshape(-1, 1)


def norm_save_scaler(df, model_name, start_date, end_date):
    dates, data = reshape_data(df, start_date, end_date)
    scaler = MinMaxScaler(feature_range=(0, 1))
    scaled_data = scaler.fit_transform(data)
    joblib.dump(scaler, f'./data/{model_name}.gz')
    return dates, scaled_data


def norm_use_scaler(df, model_name, start_date, end_date):
    dates, data = reshape_data(df, start_date, end_date)
    scaler = joblib.load(f'./data/{model_name}.gz')
    return dates, scaler.transform(data)


def inverse_norm(data, model_name):
    scaler = joblib.load(f'./data/{model_name}.gz')
    return scaler.inverse_transform(np.array(data).reshape(-1, 1))


def concat_csv(lat, lon, years):
    df = pd.DataFrame(columns=['Date', 'GHI'])
    for year in years.split(','):
        path = f'./data/{year}.csv'
        if not os.path.isfile(path):
            raise CSVFileNotFound(path)
        df = pd.concat([df, pd.read_csv(f'./data/{year}.csv', parse_dates=True)])
    return df


def create_sequences(data, seq_length):
    xs = []
    ys = []
    for i in range(len(data) - seq_length - 1):
        x = data[i:(i + seq_length)]
        y = data[i + seq_length]
        xs.append(x)
        ys.append(y)
    return np.array(xs), np.array(ys)


def create_dataloader(scaled_data, seq_length, batch_size):
    x, y = create_sequences(scaled_data, seq_length)
    dataset = torch.utils.data.TensorDataset(
        torch.from_numpy(x).float(),
        torch.from_numpy(y).float()
    )
    dataloader = torch.utils.data.DataLoader(
        dataset,
        batch_size=batch_size,
        num_workers=2,
        shuffle=False,
        pin_memory=True
    )
    return dataloader


def dataloader(
        lat, lon, years, seq_length, batch_size, model_name, norm_callback,
        start_date, end_date
):
    df = concat_csv(lat, lon, years)
    dates, scaled_data = norm_callback(df, model_name, start_date, end_date)
    dataloader = create_dataloader(scaled_data, seq_length, batch_size)
    return dates, dataloader


class LSTMDrop(nn.Module):

    def __init__(self, hidden_size, num_layers, dropout, device):
        super().__init__()
        self.hidden_size = hidden_size
        self.num_layers = num_layers
        self.dropout = dropout
        self.device = device
        self.lstm = nn.LSTM(
            input_size=1,
            hidden_size=hidden_size,
            num_layers=num_layers,
            dropout=dropout,
            batch_first=True
        )
        self.fc1 = nn.Linear(hidden_size, 1)

    def forward(self, x):
        h0 = torch.zeros(
            self.num_layers, x.size(0), self.hidden_size, device=self.device
        )
        c0 = torch.zeros(
            self.num_layers, x.size(0), self.hidden_size, device=self.device
        )
        out, (hn, cn) = self.lstm(x, (h0.detach(), c0.detach()))
        out = self.fc1(out[:, -1, :])
        return out


def train(
        lat, lon, train_years, seq_length, batch_size, model_name, start_date,
        end_date, hidden_size, num_layers, dropout, epochs, lr, decay, step_size,
        gamma
):
    _, train_loader = dataloader(
        lat, lon, train_years, seq_length, batch_size, model_name,
        norm_save_scaler, start_date, end_date
    )

    print(train_loader.dataset.tensors)

    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    model = LSTMDrop(hidden_size, num_layers, dropout, device).to(device)
    criterion = torch.nn.MSELoss()
    optimizer = torch.optim.Adam(model.parameters(), lr=lr, weight_decay=decay)
    scheduler = torch.optim.lr_scheduler.StepLR(
        optimizer, step_size=step_size, gamma=gamma
    )
    print('Start training...')
    model.train()
    for epoch in range(epochs):
        training_loss = 0.0
        for batch_id, (train_x, train_y) in enumerate(train_loader):
            train_x, train_y = train_x.to(device), train_y.to(device)
            optimizer.zero_grad()
            outputs = model(train_x)
            loss = criterion(outputs, train_y)
            loss.backward()
            optimizer.step()
            training_loss += loss.item()
        scheduler.step()
        print(
            f'Epoch Summary --> Epoch: {epoch + 1}, '
            f'Epoch Loss: {training_loss / len(train_loader)}, '
            f'LR: {optimizer.param_groups[0]["lr"]}'
        )
    print('Training complete!')
    torch.save(
        model.state_dict(), (f'./data/{model_name}.pt')
    )


# NYC
lon = 40.730610
lat = -73.935242

train_years = '1998,1999,2000,2001,2002,2003,2004,2005,2006,2007,2008'
test_years = '2009,2010'
start_splice = None
end_splice = None

horizon = 64
interval = 30

model = 'LSTM_Drop'
batch_size = 64
hidden_layer_size = 35
num_layers = 2
dropout = 0.3
epochs = 10
learning_rate = 0.001
weight_decay = 0.0001
decay_step_size = 2
learning_rate_decay = 0.5

print(f'Now training a {model} with dropout...')

train(lat, lon, train_years, horizon, batch_size, model, start_splice,
      end_splice, hidden_layer_size, num_layers, dropout, epochs, learning_rate, weight_decay, decay_step_size,
      learning_rate_decay)
