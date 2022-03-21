{{ config(enabled=var('data_model') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__transaction_lines_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__transaction_lines_tmp')),
                staging_columns=get_netsuite2_transaction_lines_columns()
            )
        }}

        --The below script allows for pass through columns.
        {% if var('transaction_lines_pass_through_columns') %}
        ,
        {{ var('transaction_lines_pass_through_columns') | join (", ")}}

        {% endif %}
        
    from base
),

final as (
    
    select
        _fivetran_synced,
        id as transaction_line_id,
        transaction as transaction_id,
        linesequencenumber as transaction_line_number,
        memo,
        entity as entity_id,
        item as item_id,
        netamount as net_amount,
        expenseaccount as expense_account_id,
        class as class_id,
        location as location_id,
        subsidiary as subsidiary_id,
        department as department_id,
        isclosed = 'T' as is_closed,
        isbillable = 'T' as is_billable,
        iscogs = 'T' as is_cogs,
        cleared = 'T' as is_cleared,
        commitmentfirm = 'T' as is_commitment_firm,
        mainline = 'T' as is_main_line,
        taxline = 'T' as is_tax_line

        --The below script allows for pass through columns.
        {% if var('transaction_lines_pass_through_columns') %}
        ,
        {{ var('transaction_lines_pass_through_columns') | join (", ")}}

        {% endif %}

    from fields
)

select * 
from final
