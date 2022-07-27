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

{{ fivetran_utils.add_pass_through_columns(columns, var('accounts_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_accounts_columns() %}

{% set columns = [

    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "parent", "datatype": dbt_utils.type_int()},
    {"name": "acctnumber", "datatype": dbt_utils.type_string()},
    {"name": "accttype", "datatype": dbt_utils.type_string()},
    {"name": "fullname", "datatype": dbt_utils.type_string()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "deferralacct", "datatype": dbt_utils.type_int()},
    {"name": "cashflowrate", "datatype": dbt_utils.type_string()},
    {"name": "generalrate", "datatype": dbt_utils.type_string()},
    {"name": "currency", "datatype": dbt_utils.type_int()},
    {"name": "class", "datatype": dbt_utils.type_int()},
    {"name": "department", "datatype": dbt_utils.type_int()},
    {"name": "location", "datatype": dbt_utils.type_int()},
    {"name": "includechildren", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "issummary", "datatype": dbt_utils.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('accounts_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}
