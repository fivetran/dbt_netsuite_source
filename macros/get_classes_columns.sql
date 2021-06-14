{% macro get_classes_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "class_id", "datatype": dbt_utils.type_float()},
    {"name": "full_name", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
