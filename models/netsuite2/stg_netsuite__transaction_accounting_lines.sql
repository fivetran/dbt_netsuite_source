{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__transaction_accounting_lines_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__transaction_accounting_lines_tmp')),
                staging_columns=get_netsuite2_transaction_accounting_lines_columns()
            )
        }}
        
    from base
),

final as (
    
    select
        _fivetran_synced,
        transaction as transaction_id,
        transactionline as transaction_line_id,
        accountingbook as accounting_book_id,
        account as account_id,
        posting = 'T' as is_posting,
        credit,
        debit,
        amount,
        netamount as net_amount,
        amountpaid as paid_amount,
        amountunpaid as unpaid_amount

    from fields
)

select * 
from final
