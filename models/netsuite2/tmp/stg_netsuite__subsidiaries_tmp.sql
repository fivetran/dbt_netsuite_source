{{ config(enabled=var('data_model') == 'netsuite2') }}

select * 
from {{ var('subsidiaries_netsuite2') }}
