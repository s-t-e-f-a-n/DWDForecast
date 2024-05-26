-- create database
CREATE DATABASE IF NOT EXISTS DWDForecast;

--create user
CREATE USER IF NOT EXISTS dwd@localhost IDENTIFIED BY 'dwd';
GRANT ALL PRIVILEGES ON DWDForecast.* TO dwd@localhost;
FLUSH PRIVILEGES;

-- create table with default values
CREATE TABLE IF NOT EXISTS dwd(
mydatetime datetime,
mytimestamp int(11) DEFAULT (0),
Rad1h float(8,2) DEFAULT (0.00),
PPPP float(8,2) DEFAULT (0.00),
FF float(5,2) DEFAULT (0.00),
TTT float(5,2) DEFAULT (0.00),
Rad1wh float(8,2) DEFAULT (0.00),
Rad1Energy float(8,2) DEFAULT (0.00),
ACSim float(8,2) DEFAULT (0.00),
DCSim float(8,2) DEFAULT (0.00),
CellTempSim float(5,2) DEFAULT (0.00),
primary key(mydatetime,mytimestamp)
);

