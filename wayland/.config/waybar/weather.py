#!/usr/bin/env python3
import requests

# uses the national weather service api
data = requests.get('https://location.services.mozilla.com/v1/geolocate?key=geoclue').json()['location']
url = requests.get(f'https://api.weather.gov/points/{data["lat"]},{data["lng"]}').json()['properties']['forecast'] + "/hourly"
temp = requests.get(url).json()['properties']['periods'][0]['temperature']
print(str(temp) + "°")
