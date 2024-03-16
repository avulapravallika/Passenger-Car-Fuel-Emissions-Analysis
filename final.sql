show databases;
create database cars_data;
use cars_data;
create table car (manufacturer text, model text, description text, transmission text, gear text, 
engine_capacity numeric, fuel_type text, powertrain text, engine_power numeric,WLTP_metric_low numeric,WLTP_metric_medium numeric, 
WLTP_metric_high numeric, WLTP_metric_extra_high numeric, WLTPCO2 numeric, Emissions_CO numeric,THC_emissions numeric, 
emissions_Nox numeric,noise_level numeric);
show tables;
select * from car;
select fuel_type,engine_capacity from car; 
select count(gear),transmission from car group by transmission;
select fuel_type,noise_level from car where noise_level>70; 
select fuel_type,engine_power from car where WLTPCO2>100; 

