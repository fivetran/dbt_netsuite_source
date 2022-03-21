{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__accounts_tmp') }}
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
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__accounts_tmp')),
                staging_columns=get_netsuite2_accounts_columns()
            )
        }}
        --The below script allows for pass through columns.
        {% if var('accounts_pass_through_columns') %}
        ,
        {{ var('accounts_pass_through_columns') | join (", ")}}

        {% endif %}
        
    from base
),

final as (
    
    select
        _fivetran_synced,
        id as account_id,
        externalid as account_external_id,
        parent as parent_id,
        acctnumber as account_number,
        accttype as account_type,
        fullname as account_full_name,
        description as account_description,
        deferralacct as deferral_account_id,
        cashflowrate as cash_flow_rate_type,
        generalrate as general_rate_type,
        currency as currency_id,
        class as class_id,
        department as department_id,
        location as location_id,
        includechildren = 'T' as is_including_child_subs,
        isinactive = 'T' as is_inactive,
        issummary = 'T' as is_summary

        --The below script allows for pass through columns.
        {% if var('accounts_pass_through_columns') %}
        ,
        {{ var('accounts_pass_through_columns') | join (", ")}}

        {% endif %}
        
    from fields
)

select * 
from final
