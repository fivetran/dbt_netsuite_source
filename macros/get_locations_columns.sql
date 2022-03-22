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

{% macro get_netsuite2_locations_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "defaultallocationpriority", "datatype": dbt_utils.type_float()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "fullname", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "includeinsupplyplanning", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "lastmodifieddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "latitude", "datatype": dbt_utils.type_float()},
    {"name": "locationtype", "datatype": dbt_utils.type_int()},
    {"name": "longitude", "datatype": dbt_utils.type_float()},
    {"name": "mainaddress", "datatype": dbt_utils.type_int()},
    {"name": "makeinventoryavailable", "datatype": dbt_utils.type_string()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent", "datatype": dbt_utils.type_int()},
    {"name": "returnaddress", "datatype": dbt_utils.type_int()},
    {"name": "subsidiary", "datatype": dbt_utils.type_string()},
    {"name": "tranprefix", "datatype": dbt_utils.type_string()},
    {"name": "usebins", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
