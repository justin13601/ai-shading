import argparse

import torch

from dataloader import dataloader, inverse_norm, norm_use_scaler
from model import LSTMDrop

import pandas as pd
import plotly.express as px
import plotly.graph_objects as go


def _construct_df(dates, predicted, actual):
    df_dict = {
        'Dates': dates.to_numpy(),
        'Predicted': predicted.flatten(),
        'Actual': actual.flatten()
    }
    return pd.DataFrame(df_dict)


def pretty_plot(dates, predicted, actual, rmse):
    df = _construct_df(dates, predicted, actual)
    layout = go.Layout(
        title=dict(
            text=f'Predicted vs Actual Irradiance (RMSE: {rmse})', x=0.5
        ),
        font=dict(size=18),
        xaxis=dict(showgrid=False, title='Date'),
        yaxis=dict(showgrid=False, zeroline=False, title='GHI (W/m^2)'),
        colorway=px.colors.qualitative.Plotly
    )
    fig = go.Figure(layout=layout)
    fig.add_trace(
        go.Scatter(
            x=df['Dates'], y=df['Actual'], name='Actual', line=dict(width=3)
        )
    )
    fig.add_trace(
        go.Scatter(
            x=df['Dates'],
            y=df['Predicted'],
            mode='lines',
            name='Predicted',
            line=dict(width=3)
        )
    )
    fig.show()


def main():
    # long lines
    parser = argparse.ArgumentParser(
        description=
        'Evaluate and plot the irradiance forecast results of a trained model'
    )
    parser.add_argument(
        '--lat', type=float, required=True, help='Latitude [Required]'
    )
    parser.add_argument(
        '--lon', type=float, required=True, help='Longitude [Required]'
    )
    parser.add_argument(
        '--test-years',
        type=str,
        required=True,
        help=
        'Comma seperated value string of downloaded irradaince data [Required]',
    )
    parser.add_argument(
        '--seq-length',
        type=int,
        default=64,
        help=
        'How many data points are needed to make one prediction [default: 64]'
    )
    parser.add_argument(
        '--model-name',
        type=str,
        default='model',
        help='Name of the saved model [default: model]'
    )
    parser.add_argument(
        '--start-date',
        type=str,
        default=None,
        help='Start date if you want to slice [default: None]'
    )
    parser.add_argument(
        '--end-date',
        type=str,
        default=None,
        help='End date if you want to slice [default: None]'
    )
    parser.add_argument(
        '--hidden-size',
        type=int,
        default=35,
        help='How many hidden neurons per LSTM layer [default: 35]'
    )
    parser.add_argument(
        '--num-layers',
        type=int,
        default=2,
        help='How many LSTM layers [default: 2]'
    )
    parser.add_argument(
        '--plot',
        action='store_true',
        default=False,
        help='Should we plot the data [default: False]'
    )
    args = vars(parser.parse_args())
    dates, predicted, actual, rmse = evaluate(**args)
    if args['plot']:
        pretty_plot(dates, predicted, actual, round(rmse, 2))


def evaluate(
        lat, lon, test_years, seq_length, model_name, start_date, end_date,
        hidden_size, num_layers, **kwargs
):
    DROPOUT, BATCH_SIZE = 0, 1
    dates, test_loader = dataloader(
        lat, lon, test_years, seq_length, BATCH_SIZE, model_name,
        norm_use_scaler, start_date, end_date
    )
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
    model = LSTMDrop(hidden_size, num_layers, DROPOUT, device).to(device)
    model.load_state_dict(
        torch.load(f'./objects/trained_models/{model_name}.pt', map_location=device)
    )
    criterion = torch.nn.MSELoss()
    print('Start testing ...')
    model.eval()
    testing_loss = 0.0
    predicted = []
    actual = []
    for x, y in test_loader:
        x, y = x.to(device), y.to(device)
        with torch.no_grad():
            outputs = model(x)
            predicted.append(outputs.item())
            actual.append(y.item())
            loss = torch.sqrt(criterion(outputs, y))
            testing_loss += loss.item()
    rmse = testing_loss / len(test_loader)
    print(f'RMSE: {rmse}')
    print('Done testing!')
    return (
        dates[seq_length + 1:],
        inverse_norm(predicted, model_name),
        inverse_norm(actual, model_name),
        rmse
    )


if __name__ == '__main__':
    main()
