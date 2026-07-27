with source_data as (
    select * exclude (VendorID, RatecodeID)
    from {{ source('tlc_taxi_trips', 'raw_yellow_tripdata') }}
),

filtered_data as (
    select *
    from source_data
    where trip_distance > 0
      and total_amount > 0
      and tpep_pickup_datetime < tpep_dropoff_datetime
      and passenger_count > 0
      and payment_type in (1, 2, 3, 4, 5, 6)
      and tip_amount >= 0
),

transformed_data as (
    select
        * exclude (passenger_count, payment_type),

        cast(passenger_count as BIGINT) as passenger_count,

        case
            when payment_type = 1 then 'Credit Card'
            when payment_type = 2 then 'Cash'
            when payment_type = 3 then 'No Charge'
            when payment_type = 4 then 'Dispute'
            when payment_type = 5 then 'Unknown'
            when payment_type = 6 then 'Voided Trip'
        end as payment_method,

        date_diff(
            'minute',
            tpep_pickup_datetime,
            tpep_dropoff_datetime
        ) as trip_duration_minutes

    from filtered_data
)

select *
from transformed_data
where trip_duration_minutes > 0