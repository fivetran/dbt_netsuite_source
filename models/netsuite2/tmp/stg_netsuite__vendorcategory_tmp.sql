{{ config(enabled=var('data_model') == 'netsuite2') }}

select * 
from {{ var('vendor_category_netsuite2') }}
