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

{% macro get_netsuite2_transaction_lines_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_float()},
    {"name": "transaction", "datatype": dbt_utils.type_float()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "class", "datatype": dbt_utils.type_float()},
    {"name": "cleared", "datatype": dbt_utils.type_string()},
    {"name": "commitmentfirm", "datatype": dbt_utils.type_string()},
    {"name": "costestimatetype", "datatype": dbt_utils.type_string()},
    {"name": "datedeleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "department", "datatype": dbt_utils.type_float()},
    {"name": "entity", "datatype": dbt_utils.type_float()},
    {"name": "expenseaccount", "datatype": dbt_utils.type_float()},
    {"name": "isbillable", "datatype": dbt_utils.type_string()},
    {"name": "isclosed", "datatype": dbt_utils.type_string()},
    {"name": "iscogs", "datatype": dbt_utils.type_string()},
    {"name": "item", "datatype": dbt_utils.type_float()},
    {"name": "itemtype", "datatype": dbt_utils.type_string()},
    {"name": "linesequencenumber", "datatype": dbt_utils.type_float()},
    {"name": "location", "datatype": dbt_utils.type_float()},
    {"name": "mainline", "datatype": dbt_utils.type_string()},
    {"name": "memo", "datatype": dbt_utils.type_string()},
    {"name": "netamount", "datatype": dbt_utils.type_float()},
    {"name": "subsidiary", "datatype": dbt_utils.type_float()},
    {"name": "taxline", "datatype": dbt_utils.type_string()},
    {"name": "uniquekey", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
