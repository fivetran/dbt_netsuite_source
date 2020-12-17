{% macro get_vendor_types_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent_id", "datatype": dbt_utils.type_float()},
    {"name": "vendor_type_extid", "datatype": dbt_utils.type_string()},
    {"name": "vendor_type_id", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
