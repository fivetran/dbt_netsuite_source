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

{{ fivetran_utils.add_pass_through_columns(columns, var('transaction_lines_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_transaction_lines_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "transaction", "datatype": dbt_utils.type_int()},
    {"name": "linesequencenumber", "datatype": dbt_utils.type_int()},
    {"name": "memo", "datatype": dbt_utils.type_string()},
    {"name": "entity", "datatype": dbt_utils.type_int()},
    {"name": "item", "datatype": dbt_utils.type_int()},
    {"name": "class", "datatype": dbt_utils.type_int()},
    {"name": "location", "datatype": dbt_utils.type_int()},
    {"name": "subsidiary", "datatype": dbt_utils.type_int()},
    {"name": "department", "datatype": dbt_utils.type_int()},
    {"name": "isclosed", "datatype": dbt_utils.type_string()},
    {"name": "isbillable", "datatype": dbt_utils.type_string()},
    {"name": "iscogs", "datatype": dbt_utils.type_string()},
    {"name": "cleared", "datatype": dbt_utils.type_string()},
    {"name": "commitmentfirm", "datatype": dbt_utils.type_string()},
    {"name": "mainline", "datatype": dbt_utils.type_string()},
    {"name": "taxline", "datatype": dbt_utils.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('transaction_lines_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}
