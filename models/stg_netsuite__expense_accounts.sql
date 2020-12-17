
with base as (

    select * 
    from {{ ref('stg_netsuite__expense_accounts_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__expense_accounts_tmp')),
                staging_columns=get_expense_accounts_columns()
            )
        }}

        --The below script allows for pass through columns.
        {% if var('expense_accounts_pass_through_columns') %}
        ,
        {{ var('expense_accounts_pass_through_columns') | join (", ")}}

        {% endif %}

        
    from base
),

final as (
    
    select 
        expense_account_id,
        name,
        parent_id,
        account_number

        --The below script allows for pass through columns.
        {% if var('expense_accounts_pass_through_columns') %}
        ,
        {{ var('expense_accounts_pass_through_columns') | join (", ")}}

        {% endif %}

    from fields
)

select * 
from final
