{{ config(enabled=var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2')) }}

with base as (

    select * 
    from {{ ref('stg_netsuite2__transactions_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite2__transactions_tmp')),
                staging_columns=get_netsuite2_transactions_columns()
            )
        }}
    from base
),

final as (
    
    select
        _fivetran_synced,
        id as transaction_id,
        transactionnumber as transaction_number,
        type as transaction_type,
        memo,
        trandate as transaction_date,
        status,
        createddate as created_at,
        duedate as due_date_at,
        closedate as closed_at,
        currency as currency_id,
        entity as entity_id,
        postingperiod as accounting_period_id,
        posting = 'T' as is_posting,
        intercoadj = 'T' as is_intercompany_adjustment,
        isreversal = 'T' as is_reversal

        --The below macro adds the fields defined within your transactions_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('transactions_pass_through_columns') }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select * 
from final
