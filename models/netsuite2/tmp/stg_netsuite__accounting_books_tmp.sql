{{ config(enabled=var('data_model', 'netsuite') == 'netsuite2') }}

select * 
from {{ var('accounting_books_netsuite2') }}
