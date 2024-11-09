#!/usr/bin/env python3

import requests, time

token = open('.apitoken', 'r').readline().rstrip()
coords = requests.get(f'https://ipinfo.io?token={token}').json()['loc']
lat,lng = coords.split(',')
url = requests.get(f'https://api.weather.gov/points/{lat},{lng}').json()['properties']['forecast'] + "/hourly"
temp = requests.get(url).json()['properties']['periods'][0]['temperature']
print(str(temp) + "°")
