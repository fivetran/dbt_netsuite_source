{{ config(enabled=var('data_model', 'netsuite') == 'netsuite') }}

select * 
from {{ var('transaction_lines') }}
