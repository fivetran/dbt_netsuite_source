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

{% macro get_netsuite2_currencies_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "currencyprecision", "datatype": dbt_utils.type_int()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "displaysymbol", "datatype": dbt_utils.type_string()},
    {"name": "exchangerate", "datatype": dbt_utils.type_float()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "fxrateupdatetimezone", "datatype": dbt_utils.type_int()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "includeinfxrateupdates", "datatype": dbt_utils.type_string()},
    {"name": "isbasecurrency", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "lastmodifieddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "overridecurrencyformat", "datatype": dbt_utils.type_string()},
    {"name": "symbol", "datatype": dbt_utils.type_string()},
    {"name": "symbolplacement", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
