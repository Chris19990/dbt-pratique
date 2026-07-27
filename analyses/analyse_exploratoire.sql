--Select * from 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-01.parquet' limit 10;
--Select Count(*) from 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-02.parquet';


--Describe select * from 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-01.parquet'; 
--select VendorID, count(*) as trip_count 
--from 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-01.parquet' 
--group by VendorID order by trip_count desc;

--select RateCodeID, count(*) as trip_count 
--from 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-01.parquet' 
group by RatecodeID order by trip_count desc;

--select Payment_type, count(*) as trip_count 
from 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-01.parquet' 
group by Payment_type order by trip_count desc;

--select count(*) as trip_count
from 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-01.parquet' 
where tpep_pickup_datetime > tpep_dropoff_datetime;

--select *
from 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-01.parquet' 
where tpep_pickup_datetime > tpep_dropoff_datetime limit 10;
--.read './analyse_exploratoire.sql'

-- distance abérrante
select  tpep_pickup_datetime, tpep_dropoff_datetime, trip_distance, passenger_count, total_amount
from 'https://d37ci6vzurychx.cloudfront.net/trip-data/y ellow_tripdata_2026-01.parquet' 
where trip_distance < 0
 limit 10;

 select tpep_pickup_datetime, tpep_dropoff_datetime, trip_distance, passenger_count, total_amount
from 'https://d37ci6vzurychx.cloudfront.net/trip-data/y ellow_tripdata_2024-01.parquet' 
where trip_distance = 0
 limit 10;

 select * from 'https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2026-01.parquet' 
 where total_amount < 0 limit 10;