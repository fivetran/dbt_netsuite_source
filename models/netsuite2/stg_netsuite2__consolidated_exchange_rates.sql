{{ config(enabled=(var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2') and var('netsuite2__using_exchange_rate', true))) }}

with base as (

    select * 
    from {{ ref('stg_netsuite2__consolidated_exchange_rates_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite2__consolidated_exchange_rates_tmp')),
                staging_columns=get_netsuite2_consolidated_exchange_rates_columns()
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
        id as consolidated_exchange_rate_id,
        postingperiod as accounting_period_id,
        fromcurrency as from_currency_id,
        fromsubsidiary as from_subsidiary_id,
        tocurrency as to_currency_id,
        tosubsidiary as to_subsidiary_id,
        accountingbook as accounting_book_id,
        currentrate as current_rate, 
        averagerate as average_rate,
        historicalrate as historical_rate,
        source_relation

        --The below macro adds the fields defined within your consolidated_exchange_rates_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('consolidated_exchange_rates_pass_through_columns') }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select * 
from final