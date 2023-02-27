{{ config(materialized='view') }}

SELECT count(*)  as trip_count
FROM {{ref('stg_divvybike_tripdata')}}
GROUP BY member_casual
