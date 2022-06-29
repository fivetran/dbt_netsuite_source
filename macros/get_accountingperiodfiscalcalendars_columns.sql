{% macro get_accountingperiodfiscalcalendars_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_id", "datatype": dbt_utils.type_string()},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "accountingperiod", "datatype": dbt_utils.type_int()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "fiscalcalendar", "datatype": dbt_utils.type_int()},
    {"name": "parent", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
