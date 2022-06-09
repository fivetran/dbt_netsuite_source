{{ config(enabled=var('data_model') == 'netsuite2') }}

select *
from {{ var('customers_netsuite2') }}