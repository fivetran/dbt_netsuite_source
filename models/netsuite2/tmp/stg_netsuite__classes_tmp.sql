{{ config(enabled=var('data_model', 'netsuite') == 'netsuite2') }}

select *
from {{ var('classes_netsuite2') }}