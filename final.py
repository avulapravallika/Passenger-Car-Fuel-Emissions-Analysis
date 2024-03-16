#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Dec  5 01:44:41 2022

@author: pravallikaavula
"""


# import needed libraries
import pandas as pd  # for data frame creation
pd.set_option('display.max_rows', 500)
pd.set_option('display.max.columns', 20)

# import graphing library
import matplotlib.pyplot as plt

import numpy as np

import os  # for OS interface (to get/change directory)
# display and set working/data directory
os.getcwd()
os.chdir('/Users/pravallikaavula/Downloads/AIT/Assignments/Final')
os.getcwd()

# import the data , note the field separator

car = pd.read_csv("car_latest.csv", sep=",")


#Cleaning the DATA
del car['Engine_Power']
del car['Engine_Power.1']
del car['Euro_Standard']
del car['wh/km']
del car['Powertrain']
del car['Maximum_range']
del car['Maximum_range.1']
del car['Diesel_VED_Supplement']
del car['Testing_Scheme']
del car['WLTP_Imperial_Low']
del car['WLTP_Imperial_Medium']
del car['WLTP_Imperial_High']
del car['WLTP_Imperial_Extra_High']
del car['WLTP_Imperial_Combined']
del car['WLTP_Imperial_Combined.1']
del car['WLTP_Metric_Combined']
del car['WLTP_Metric_Combined.1']
del car['WLTP_CO2_Weighted']
del car['THC_Nox_Emissions']
del car['RDE_Nox_Urban']
del car['RDE_Nox_Combined']

car.info()

#exploring the data
car.head(10)
car.tail(10)
car.columns
car.dtypes

#Plotting the manufacturers causing the most air pollution
plt.title('car manufacturer producing the most air pollution ', color='black')
plt.xlabel('Manufacturer', color='red')
plt.ylabel('Emissions', color='red')
plt.xticks(rotation=90)
plt.bar(car.Manufacturer,car.WLTP_CO2, color='orange')

#Plotting the manufacturers causing the most noise pollution
plt.title('car manufacturer producing the most noise pollution ', color='black')
plt.xlabel('Manufacturer', color='red')
plt.ylabel('Emissions', color='red')
plt.xticks(rotation=90)
plt.bar(car.Manufacturer,car.Noise_Level, color='green')


#Comparing fuel type with fuel consumption
plt.title('Fuel type and fuel consumption', color='black')
plt.xlabel('Fuel type', color='red')
plt.ylabel('Fuel consumption', color='red')
plt.xticks(rotation=90)
plt.bar(car.Fuel_Type,car.WLTP_Metric_Low)

#Comparing fuel type with fuel consumption
plt.title('Fuel type and fuel consumption', color='black')
plt.xlabel('Fuel type', color='red')
plt.ylabel('Fuel consumption', color='red')
plt.xticks(rotation=90)
plt.bar(car.Fuel_Type,car.WLTP_Metric_Medium)

#Comparing fuel type with fuel consumption
plt.title('Fuel type and fuel consumption', color='black')
plt.xlabel('Fuel type', color='red')
plt.ylabel('Fuel consumption', color='red')
plt.xticks(rotation=90)
plt.bar(car.Fuel_Type,car.WLTP_Metric_High)

#Comparing fuel type with fuel consumption
plt.title('Fuel type and fuel consumption', color='black')
plt.xlabel('Fuel type', color='red')
plt.ylabel('Fuel consumption', color='red')
plt.xticks(rotation=90)
plt.bar(car.Fuel_Type,car.WLTP_Metric_Extra_High)


#Comparing fuel type with emmissions
plt.title('Fuel type v/s emissions', color='black')
plt.xlabel('Fuel type', color='red')
plt.ylabel('Emissions', color='red')
plt.xticks(rotation=90)
plt.bar(car.Fuel_Type,car.WLTP_CO2)


car.Fuel_Type.describe()
car.WLTP_Metric_Low.describe()
car.WLTP_Metric_Medium.describe()
car.WLTP_Metric_High.describe()
car.WLTP_Metric_Extra_High.describe()




