{% macro get_accounts_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "account_id", "datatype": dbt_utils.type_float()},
    {"name": "accountnumber", "datatype": dbt_utils.type_string()},
    {"name": "general_rate_type", "datatype": dbt_utils.type_string()},
    {"name": "is_balancesheet", "datatype": dbt_utils.type_string()},
    {"name": "is_leftside", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent_id", "datatype": dbt_utils.type_float()},
    {"name": "type_name", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
