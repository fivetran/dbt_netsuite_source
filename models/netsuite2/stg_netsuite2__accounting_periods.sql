{{ config(enabled=var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2')) }}

with base as (

    select * 
    from {{ ref('stg_netsuite2__accounting_periods_tmp') }}

),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite2__accounting_periods_tmp')),
                staging_columns=get_netsuite2_accounting_periods_columns()
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
        id as accounting_period_id,
        parent as parent_id, 
        periodname as name,
        startdate as starting_at,
        enddate as ending_at,
        closedondate as closed_at,
        isquarter = 'T' as is_quarter,
        isyear = 'T' as is_year,
        isadjust = 'T' as is_adjustment,
        isposting = 'T' as is_posting,
        closed = 'T' as is_closed,
        alllocked = 'T' as is_all_locked,
        arlocked = 'T' as is_ar_locked,
        aplocked = 'T' as is_ap_locked,
        source_relation
    from fields
    where not coalesce(_fivetran_deleted, false)
)

select * 
from final