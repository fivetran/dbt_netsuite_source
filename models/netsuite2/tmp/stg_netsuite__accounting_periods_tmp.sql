{{ config(enabled=var('data_model') == 'netsuite2') }}

select *
from {{ var('accounting_periods_netsuite2') }}
