{{ config(enabled=var('data_model') == 'netsuite2') }}

select *
from {{ var('classes_netsuite2') }}