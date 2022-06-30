{% macro get_accounttype_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "balancesheet", "datatype": dbt_utils.type_string()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "defaultcashflowratetype", "datatype": dbt_utils.type_string()},
    {"name": "defaultgeneralratetype", "datatype": dbt_utils.type_string()},
    {"name": "eliminationalgo", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_string()},
    {"name": "includeinrevaldefault", "datatype": dbt_utils.type_string()},
    {"name": "internalid", "datatype": dbt_utils.type_int()},
    {"name": "left", "datatype": dbt_utils.type_string(), "quote": True},
    {"name": "longname", "datatype": dbt_utils.type_string()},
    {"name": "seqnum", "datatype": dbt_utils.type_int()},
    {"name": "usercanchangerevaloption", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
