{{ config(enabled=var('data_model') == 'netsuite2') }}

select * 
from {{ var('transactions_netsuite2') }}
