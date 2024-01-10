{{ config(enabled=(var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2') and var('netsuite2__using_vendor_categories', true))) }}

with base as (

    select * 
    from {{ ref('stg_netsuite2__vendor_categories_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite2__vendor_categories_tmp')),
                staging_columns=get_vendorcategory_columns()
            )
        }}

        {{ fivetran_utils.source_relation(
            union_schema_variable='netsuite2_union_schemas', 
            union_database_variable='netsuite2_union_databases')
        }}

    from base
),

final as (
    
    select
        id as vendor_category_id,
        name,
        _fivetran_synced,
        source_relation
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final