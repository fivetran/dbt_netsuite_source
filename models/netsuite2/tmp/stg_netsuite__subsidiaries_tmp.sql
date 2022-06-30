{{ config(enabled=var('data_model', 'netsuite') == 'netsuite2') }}

select * 
from {{ var('subsidiaries_netsuite2') }}
