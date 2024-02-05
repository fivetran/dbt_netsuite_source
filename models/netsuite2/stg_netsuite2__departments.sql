{{ config(enabled=var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2')) }}

with base as (

    select * 
    from {{ ref('stg_netsuite2__departments_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite2__departments_tmp')),
                staging_columns=get_netsuite2_departments_columns()
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
        id as department_id,
        parent as parent_id,
        name,
        fullname as full_name,
        subsidiary as subsidiary_id,
        isinactive = 'T' as is_inactive,
        _fivetran_deleted,
        source_relation

        --The below macro adds the fields defined within your departments_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('departments_pass_through_columns') }}

    from fields
)

select * 
from final