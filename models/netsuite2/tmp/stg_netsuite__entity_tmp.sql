{{ config(enabled=var('data_model') == 'netsuite2') }}

select * 
from {{ var('entity_netsuite2') }}