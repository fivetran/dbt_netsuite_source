{{ config(enabled=var('data_model', 'netsuite') == 'netsuite2') }}

select *
from {{ var('netsuite2_consolidated_exchange_rates') }}