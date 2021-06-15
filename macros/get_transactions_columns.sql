{% macro get_transactions_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "accounting_period_id", "datatype": dbt_utils.type_float()},
    {"name": "currency_id", "datatype": dbt_utils.type_float()},
    {"name": "due_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "is_advanced_intercompany", "datatype": dbt_utils.type_string()},
    {"name": "is_intercompany", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "trandate", "datatype": dbt_utils.type_timestamp()},
    {"name": "transaction_id", "datatype": dbt_utils.type_float()},
    {"name": "transaction_type", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}