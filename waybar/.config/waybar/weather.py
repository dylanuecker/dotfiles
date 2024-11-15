#!/usr/bin/env python3

import os
import requests

def get_current_temp(file):
    try:
        token = open(file, 'r').readline().rstrip()
        coords = requests.get(f'https://ipinfo.io?token={token}').json()['loc']
        lat,lng = coords.split(',')
        url = requests.get(f'https://api.weather.gov/points/{lat},{lng}').json()['properties']['forecastHourly']
        temp = requests.get(url).json()['properties']['periods'][0]['temperature']
        print(str(temp) + "°")
    except:
        pass

file = os.path.join(os.path.dirname(__file__), '.apitoken')
if os.path.exists(file):
    get_current_temp(file)
