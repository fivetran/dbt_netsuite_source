{% macro get_currencies_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency_extid", "datatype": dbt_utils.type_string()},
    {"name": "currency_id", "datatype": dbt_utils.type_float()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_last_modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "is_inactive", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "precision_0", "datatype": dbt_utils.type_float()},
    {"name": "symbol", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
