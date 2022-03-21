{{ config(enabled=var('data_model') == 'netsuite2') }}

select * 
from {{ var('vendors_netsuite2') }}
