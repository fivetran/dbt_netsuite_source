{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__locations_tmp') }}
    where not coalesce(_fivetran_deleted, false)

),

fields as (

    select
        /*
        The below macro is used to generate the correct SQL for package staging models. It takes a list of columns 
        that are expected/needed (staging_columns from dbt_salesforce_source/models/tmp/) and compares it with columns 
        in the source (source_columns from dbt_salesforce_source/macros/).
        For more information refer to our dbt_fivetran_utils documentation (https://github.com/fivetran/dbt_fivetran_utils.git).
        */

        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__locations_tmp')),
                staging_columns=get_netsuite2_locations_columns()
            )
        }}

        --The below script allows for pass through columns.
        {% if var('locations_pass_through_columns') %}
        ,
        {{ var('locations_pass_through_columns') | join (", ")}}

        {% endif %}
        
    from base
),

final as (
    
    select
        _fivetran_synced,
        id as location_id,
        name as location_name,
        fullname as location_full_name,
        mainaddress as main_address_id,
        parent as parent_id,
        subsidiary as subsidiary_id

        --The below script allows for pass through columns.
        {% if var('locations_pass_through_columns') %}
        ,
        {{ var('locations_pass_through_columns') | join (", ")}}

        {% endif %}

    from fields
)

select * 
from final
