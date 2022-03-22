{% macro get_departments_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "department_id", "datatype": dbt_utils.type_float()},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_departments_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "fullname", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "includechildren", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "lastmodifieddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent", "datatype": dbt_utils.type_int()},
    {"name": "subsidiary", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
