{% macro get_customers_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "city", "datatype": dbt_utils.type_string()},
    {"name": "companyname", "datatype": dbt_utils.type_string()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "customer_extid", "datatype": dbt_utils.type_string()},
    {"name": "customer_id", "datatype": dbt_utils.type_float()},
    {"name": "date_first_order", "datatype": dbt_utils.type_timestamp()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "zipcode", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_customers_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_float()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "companyname", "datatype": dbt_utils.type_string()},
    {"name": "currency", "datatype": dbt_utils.type_float()},
    {"name": "defaultbillingaddress", "datatype": dbt_utils.type_float()},
    {"name": "defaultshippingaddress", "datatype": dbt_utils.type_float()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "entityid", "datatype": dbt_utils.type_float()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "firstname", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "isperson", "datatype": dbt_utils.type_string()},
    {"name": "lastname", "datatype": dbt_utils.type_string()},
    {"name": "parent", "datatype": dbt_utils.type_float()},
    {"name": "phone", "datatype": dbt_utils.type_string()},
    {"name": "receivablesaccount", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
