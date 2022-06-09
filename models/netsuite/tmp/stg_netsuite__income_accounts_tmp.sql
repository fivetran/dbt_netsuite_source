{{ config(enabled=var('data_model') == 'netsuite') }}

select * 
from {{ var('income_accounts') }}
