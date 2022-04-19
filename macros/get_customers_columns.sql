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

{{ return(columns) }}

{% endmacro %}
