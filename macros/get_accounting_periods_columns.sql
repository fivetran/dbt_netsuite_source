{% macro get_accounting_periods_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_id", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "accounting_period_id", "datatype": dbt_utils.type_float()},
    {"name": "closed", "datatype": dbt_utils.type_string()},
    {"name": "closed_accounts_payable", "datatype": dbt_utils.type_string()},
    {"name": "closed_accounts_receivable", "datatype": dbt_utils.type_string()},
    {"name": "closed_all", "datatype": dbt_utils.type_string()},
    {"name": "closed_on", "datatype": dbt_utils.type_timestamp()},
    {"name": "closed_payroll", "datatype": dbt_utils.type_string()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_last_modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "ending", "datatype": dbt_utils.type_timestamp()},
    {"name": "fiscal_calendar_id", "datatype": dbt_utils.type_float()},
    {"name": "fivetran_index", "datatype": dbt_utils.type_string()},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "is_adjustment", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "locked_accounts_payable", "datatype": dbt_utils.type_string()},
    {"name": "locked_accounts_receivable", "datatype": dbt_utils.type_string()},
    {"name": "locked_all", "datatype": dbt_utils.type_string()},
    {"name": "locked_payroll", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent_id", "datatype": dbt_utils.type_float()},
    {"name": "quarter", "datatype": dbt_utils.type_string()},
    {"name": "starting", "datatype": dbt_utils.type_timestamp()},
    {"name": "year_0", "datatype": dbt_utils.type_string()},
    {"name": "year_id", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_accounting_periods_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "alllocked", "datatype": dbt_utils.type_string()},
    {"name": "allownonglchanges", "datatype": dbt_utils.type_string()},
    {"name": "aplocked", "datatype": dbt_utils.type_string()},
    {"name": "arlocked", "datatype": dbt_utils.type_string()},
    {"name": "closed", "datatype": dbt_utils.type_string()},
    {"name": "closedondate", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "enddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "isadjust", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "isposting", "datatype": dbt_utils.type_string()},
    {"name": "isquarter", "datatype": dbt_utils.type_string()},
    {"name": "isyear", "datatype": dbt_utils.type_string()},
    {"name": "lastmodifieddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "parent", "datatype": dbt_utils.type_int()},
    {"name": "periodname", "datatype": dbt_utils.type_string()},
    {"name": "startdate", "datatype": dbt_utils.type_timestamp()}
] %}

{{ return(columns) }}

{% endmacro %}
