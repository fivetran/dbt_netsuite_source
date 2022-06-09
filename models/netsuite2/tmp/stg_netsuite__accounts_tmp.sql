{{ config(enabled=var('data_model') == 'netsuite2') }}

select *
from {{ var('accounts_netsuite2') }}
