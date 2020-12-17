{% macro get_expense_accounts_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "account_number", "datatype": dbt_utils.type_string()},
    {"name": "comments", "datatype": dbt_utils.type_string()},
    {"name": "current_balance", "datatype": dbt_utils.type_float()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_last_modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "desription", "datatype": dbt_utils.type_string()},
    {"name": "expense_account_extid", "datatype": dbt_utils.type_string()},
    {"name": "expense_account_id", "datatype": dbt_utils.type_float()},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "is_including_child_subs", "datatype": dbt_utils.type_string()},
    {"name": "is_summary", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "legal_name", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent_id", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
