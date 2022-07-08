{{ config(enabled=var('data_model', 'netsuite') == 'netsuite2') }}

select * 
from {{ var('netsuite2_accounting_book_subsidiaries') }}
