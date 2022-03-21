{{ config(enabled=var('data_model') == 'netsuite') }}

select * 
from {{ var('accounting_books') }}
