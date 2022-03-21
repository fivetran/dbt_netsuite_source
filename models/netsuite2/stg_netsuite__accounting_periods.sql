{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__accounting_periods_tmp') }}
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
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__accounting_periods_tmp')),
                staging_columns=get_netsuite2_accounting_periods_columns()
            )
        }}
        
    from base
),

final as (
    
    select
        _fivetran_synced,
        id as accounting_period_id,
        parent as parent_id,
        periodname as period_name,
        startdate as start_at,
        enddate as end_at,
        closedondate as closed_at,
        isquarter = 'T' as is_quarter,
        isyear = 'T' as is_year,
        isadjust = 'T' as is_adjustment,
        isposting = 'T' as is_posting,
        closed = 'T' as is_closed,
        alllocked = 'T' as is_all_locked,
        arlocked = 'T' as is_ar_locked,
        aplocked = 'T' as is_ap_locked

    from fields
)

select * 
from final
