{{ config(enabled=var('data_model') == 'netsuite2') }}

select * 
from {{ var('locations_netsuite2') }}
