{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__consolidated_exchange_rates_tmp') }}
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
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__consolidated_exchange_rates_tmp')),
                staging_columns=get_netsuite2_consolidated_exchange_rates_columns()
            )
        }}
        
    from base
),

final as (
    
    select
        id as consolidated_exchange_rate_id,
        postingperiod as accounting_period_id,
        fromcurrency as from_currency_id,
        fromsubsidiary as from_subsidiary_id,
        tocurrency as to_currency_id,
        tosubsidiary as to_subsidiary_id,
        currentrate as current_rate,
        averagerate as average_rate,
        historicalrate as historical_rate

        --The below script allows for pass through columns.
        {% if var('consolidated_exchange_rates_pass_through_columns') %}
        ,
        {{ var('consolidated_exchange_rates_pass_through_columns') | join (", ")}}

        {% endif %}

    from fields
)

select * 
from final
