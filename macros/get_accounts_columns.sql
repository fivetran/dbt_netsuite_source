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

{% macro get_netsuite2_accounts_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_float()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "acctnumber", "datatype": dbt_utils.type_string()},
    {"name": "accttype", "datatype": dbt_utils.type_string()},
    {"name": "cashflowrate", "datatype": dbt_utils.type_string()},
    {"name": "class", "datatype": dbt_utils.type_float()},
    {"name": "currency", "datatype": dbt_utils.type_float()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "deferralacct", "datatype": dbt_utils.type_float()},
    {"name": "department", "datatype": dbt_utils.type_string()},
    {"name": "description", "datatype": dbt_utils.type_string()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "fullname", "datatype": dbt_utils.type_string()},
    {"name": "generalrate", "datatype": dbt_utils.type_string()},
    {"name": "includechildren", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "issummary", "datatype": dbt_utils.type_string()},
    {"name": "location", "datatype": dbt_utils.type_float()},
    {"name": "parent", "datatype": dbt_utils.type_float()},
] %}

{{ return(columns) }}

{% endmacro %}
