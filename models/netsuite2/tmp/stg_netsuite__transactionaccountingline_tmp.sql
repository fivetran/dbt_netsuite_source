{{ config(enabled=var('data_model') == 'netsuite2') }}

select * 
from {{ var('transaction_accounting_lines_netsuite2') }}
