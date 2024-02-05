{{ config(enabled=var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2')) }}

with base as (

    select * 
    from {{ ref('stg_netsuite2__entity_address_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite2__entity_address_tmp')),
                staging_columns=get_entityaddress_columns()
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
        addr1,
        addr2,
        addr3,
        addressee,
        addrtext as full_address,
        city,
        country,
        coalesce(state, dropdownstate) as state,
        nkey,
        zip as zipcode,
        source_relation
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final