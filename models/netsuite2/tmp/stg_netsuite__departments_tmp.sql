{{ config(enabled=var('data_model', 'netsuite') == 'netsuite2') }}

select *
from {{ var('departments_netsuite2') }}
