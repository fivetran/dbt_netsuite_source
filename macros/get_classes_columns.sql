{% macro get_classes_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "class_id", "datatype": dbt_utils.type_float()},
    {"name": "full_name", "datatype": dbt_utils.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('classes_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_classes_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "fullname", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('classes_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}
