import functions_framework
import datetime
import pandas as pd
# import numpy as np
import pvlib
from pvlib.forecast import NAM
# from flask import jsonify

@functions_framework.http
def get_irradiance_data(request):
    """
    HTTP Cloud Function to retrieve solar irradiance data.
    
    Args:
        request (flask.Request): The request object.
            Expected JSON format:
            {
                "latitude": 51.087,
                "longitude": -114.1293,
                "tz": "Canada/Mountain"
            }
    
    Returns:
        The processed forecasted solar irradiance data in JSON format.

    @justin@aishading.com
    """
    request_json = request.get_json(silent=True)
    
    if not request_json:
        return "Invalid input, please consult documentation.", 400
    
    latitude = request_json.get('latitude')
    longitude = request_json.get('longitude')
    tz = request_json.get('tz')
    
    if not latitude or not longitude or not tz:
        return "Latitude, longitude, and tz are required fields.", 400
    
    start = pd.Timestamp(datetime.datetime.now() + datetime.timedelta(hours=10), tz=tz)
    end = start + pd.Timedelta(days=1)
    
    # Initialize NAM model
    fm = NAM()

    # Get data from UNIDATA THREDD servers
    data = fm.get_data(latitude, longitude, start, end)

    # Forecast data
    data = fm.process_data(data)

    # Type cast timestamp indices to string for return request
    data.index = data.index.strftime('%Y-%m-%d %H:%M:%S %Z')

    # Fill NaN values to be 0 (temp)
    data.fillna(0, inplace=True)

    # Processed data can be further modified or converted to JSON format as needed
    processed_data = {
        "latitude": latitude,
        "longitude": longitude,
        "timeZone": tz,
        "startTime": start.strftime('%Y-%m-%d %H:%M:%S %Z'),
        "endTime": end.strftime('%Y-%m-%d %H:%M:%S %Z'),
        "data": data.to_dict()  # Convert the processed forecasted data to a dictionary
    }

    return processed_data
