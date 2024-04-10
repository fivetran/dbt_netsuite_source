{{ config(enabled=var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2')) }}

with base as (

    select * 
    from {{ ref('stg_netsuite2__accounting_period_fiscal_cal_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite2__accounting_period_fiscal_cal_tmp')),
                staging_columns=get_accountingperiodfiscalcalendars_columns()
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
        _fivetran_id,
        _fivetran_synced,
        accountingperiod as accounting_period_id,
        fiscalcalendar as fiscal_calendar_id,
        parent as parent_id,
        source_relation
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final