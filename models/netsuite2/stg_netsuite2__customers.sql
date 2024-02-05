{{ config(enabled=var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2')) }}

with base as (

    select * 
    from {{ ref('stg_netsuite2__customers_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite2__customers_tmp')),
                staging_columns=get_netsuite2_customers_columns()
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
        id as customer_id,
        entityid as entity_id,
        externalid as customer_external_id,
        parent as parent_id,
        isperson = 'T' as is_person,
        companyname as company_name,
        firstname as first_name,
        lastname as last_name,
        email as email_address,
        phone as phone_number,
        defaultbillingaddress as default_billing_address_id,
        defaultshippingaddress as default_shipping_address_id,
        receivablesaccount as receivables_account_id,
        currency as currency_id,
        firstorderdate as date_first_order_at,
        source_relation

        --The below macro adds the fields defined within your customers_pass_through_columns variable into the staging model
        {{ fivetran_utils.fill_pass_through_columns('customers_pass_through_columns') }}

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select * 
from final