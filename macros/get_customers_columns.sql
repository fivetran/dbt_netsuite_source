{% macro get_customers_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "city", "datatype": dbt_utils.type_string()},
    {"name": "companyname", "datatype": dbt_utils.type_string()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "customer_extid", "datatype": dbt_utils.type_string()},
    {"name": "customer_id", "datatype": dbt_utils.type_float()},
    {"name": "date_first_order", "datatype": dbt_utils.type_timestamp()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "zipcode", "datatype": dbt_utils.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('customers_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_customers_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "entityid", "datatype": dbt_utils.type_string()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "parent", "datatype": dbt_utils.type_int()},
    {"name": "isperson", "datatype": dbt_utils.type_string()},
    {"name": "companyname", "datatype": dbt_utils.type_string()},
    {"name": "firstname", "datatype": dbt_utils.type_string()},
    {"name": "lastname", "datatype": dbt_utils.type_string()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "phone", "datatype": dbt_utils.type_string()},
    {"name": "defaultbillingaddress", "datatype": dbt_utils.type_int()},
    {"name": "defaultshippingaddress", "datatype": dbt_utils.type_int()},
    {"name": "receivablesaccount", "datatype": dbt_utils.type_int()},
    {"name": "currency", "datatype": dbt_utils.type_int()},
    {"name": "firstorderdate", "datatype": dbt_utils.type_timestamp()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('customers_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}
