{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__classes_tmp') }}
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
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__classes_tmp')),
                staging_columns=get_netsuite2_classes_columns()
            )
        }}

        --The below script allows for pass through columns.
        {% if var('classes_pass_through_columns') %}
        ,
        {{ var('classes_pass_through_columns') | join (", ")}}

        {% endif %}
        
    from base
),

final as (
    
    select
        _fivetran_synced,
        id as class_id,
        externalid as class_external_id,
        name,
        fullname as full_name,
        isinactive = 'T' as is_inactive

        --The below script allows for pass through columns.
        {% if var('classes_pass_through_columns') %}
        ,
        {{ var('classes_pass_through_columns') | join (", ")}}

        {% endif %}

    from fields
)

select * 
from final
