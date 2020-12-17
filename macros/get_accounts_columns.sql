{% macro get_accounts_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "account_extid", "datatype": dbt_utils.type_string()},
    {"name": "account_id", "datatype": dbt_utils.type_float()},
    {"name": "accountnumber", "datatype": dbt_utils.type_string()},
    {"name": "bank_account_number", "datatype": dbt_utils.type_string()},
    {"name": "bill_com_last_updated_by_impo", "datatype": dbt_utils.type_string()},
    {"name": "budget_type", "datatype": dbt_utils.type_string()},
    {"name": "cashflow_rate_type", "datatype": dbt_utils.type_string()},
    {"name": "category_1099_misc", "datatype": dbt_utils.type_string()},
    {"name": "category_1099_misc_mthreshold", "datatype": dbt_utils.type_float()},
    {"name": "class_id", "datatype": dbt_utils.type_float()},
    {"name": "currency_id", "datatype": dbt_utils.type_float()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_last_modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "deferral_account_id", "datatype": dbt_utils.type_float()},
    {"name": "department_id", "datatype": dbt_utils.type_float()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "full_description", "datatype": dbt_utils.type_string()},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "general_rate_type", "datatype": dbt_utils.type_string()},
    {"name": "is_balancesheet", "datatype": dbt_utils.type_string()},
    {"name": "is_included_in_elimination", "datatype": dbt_utils.type_string()},
    {"name": "is_included_in_reval", "datatype": dbt_utils.type_string()},
    {"name": "is_including_child_subs", "datatype": dbt_utils.type_string()},
    {"name": "is_leftside", "datatype": dbt_utils.type_string()},
    {"name": "is_summary", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "legal_name", "datatype": dbt_utils.type_string()},
    {"name": "location_id", "datatype": dbt_utils.type_float()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "openbalance", "datatype": dbt_utils.type_float()},
    {"name": "parent_id", "datatype": dbt_utils.type_float()},
    {"name": "type_name", "datatype": dbt_utils.type_string()},
    {"name": "type_sequence", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
