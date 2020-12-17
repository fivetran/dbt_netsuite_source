{% macro get_departments_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "bill_com_last_updated_by_impo", "datatype": dbt_utils.type_string()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_last_modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "department_extid", "datatype": dbt_utils.type_string()},
    {"name": "department_id", "datatype": dbt_utils.type_float()},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "is_including_child_subs", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent_id", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
