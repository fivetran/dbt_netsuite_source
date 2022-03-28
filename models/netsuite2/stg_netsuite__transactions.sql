{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__transactions_tmp') }}
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
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__transactions_tmp')),
                staging_columns=get_netsuite2_transactions_columns()
            )
        }}

        --The below script allows for pass through columns.
        {% if var('transactions_pass_through_columns') %}
        ,
        {{ var('transactions_pass_through_columns') | join (", ")}}

        {% endif %}
        
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
        status as transaction_status,
        createddate as created_at,
        duedate as due_date,
        closedate as closed_at,
        currency as currency_id,
        entity as entity_id,
        postingperiod as accounting_period_id,
        posting = 'T' as is_posting,
        intercoadj = 'T' as is_intercompany_adjustment,
        isreversal = 'T' as is_reversal

        --The below script allows for pass through columns.
        {% if var('transactions_pass_through_columns') %}
        ,
        {{ var('transactions_pass_through_columns') | join (", ")}}

        {% endif %}

    from fields
)

select * 
from final
