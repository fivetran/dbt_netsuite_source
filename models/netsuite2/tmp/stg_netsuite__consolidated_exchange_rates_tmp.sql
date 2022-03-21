{{ config(enabled=var('data_model') == 'netsuite2') }}

select *
from {{ var('consolidated_exchange_rates_netsuite2') }}