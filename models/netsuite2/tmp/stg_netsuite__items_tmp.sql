{{ config(enabled=var('data_model', 'netsuite') == 'netsuite2') }}

select * 
from {{ var('items_netsuite2') }}
