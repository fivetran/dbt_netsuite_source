{{ config(enabled=var('netsuite_data_model', 'netsuite') == var('netsuite2_variable_name','netsuite2')) }}

select * 
from {{ var('netsuite2_accounting_books') }}
