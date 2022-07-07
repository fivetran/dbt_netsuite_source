{{ config(enabled=var('data_model', 'netsuite') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__customers_tmp') }}

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
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__customers_tmp')),
                staging_columns=get_netsuite2_customers_columns()
            )
        }}
        
    from base
),

final as (
    
    select
        _fivetran_synced,
        id as customer_id, --
        entityid as entity_id, -- not in netsuite1 but need to bring this in to join with geo data
        externalid as customer_external_id, --
        parent as parent_id,
        isperson = 'T' as is_person,
        companyname as company_name, --
        firstname as first_name,
        lastname as last_name,
        email as email_address,
        phone as phone_number,
        defaultbillingaddress as default_billing_address_id,
        defaultshippingaddress as default_shipping_address_id,
        receivablesaccount as receivables_account_id,
        currency as currency_id,
        firstorderdate as date_first_order_at

        --The below macro adds the fields defined within your customers_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('customers_pass_through_columns') }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select * 
from final
