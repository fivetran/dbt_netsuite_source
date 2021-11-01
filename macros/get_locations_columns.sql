{% macro get_locations_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "city", "datatype": dbt_utils.type_string()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "location_id", "datatype": dbt_utils.type_float()},
    {"name": "name", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
