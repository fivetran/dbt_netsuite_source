{{ config(enabled=var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2')) }}

with base as (

    select * 
    from {{ ref('stg_netsuite2__classes_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite2__classes_tmp')),
                staging_columns=get_netsuite2_classes_columns()
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
        _fivetran_synced,
        id as class_id,
        externalid as class_external_id,
        name,
        fullname as full_name,
        isinactive = 'T' as is_inactive,
        _fivetran_deleted,
        source_relation

        --The below macro adds the fields defined within your classes_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('classes_pass_through_columns') }}

    from fields
)

select * 
from final