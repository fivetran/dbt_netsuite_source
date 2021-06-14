{% macro get_transaction_lines_columns() %}

{% set columns = [
    {"name": "account_id", "datatype": dbt_utils.type_float()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "class_id", "datatype": dbt_utils.type_float()},
    {"name": "company_id", "datatype": dbt_utils.type_float()},
    {"name": "department_id", "datatype": dbt_utils.type_float()},
    {"name": "item_id", "datatype": dbt_utils.type_float()},
    {"name": "location_id", "datatype": dbt_utils.type_float()},
    {"name": "memo", "datatype": dbt_utils.type_string()},
    {"name": "non_posting_line", "datatype": dbt_utils.type_string()},
    {"name": "subsidiary_id", "datatype": dbt_utils.type_float()},
    {"name": "transaction_id", "datatype": dbt_utils.type_float()},
    {"name": "transaction_line_id", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
