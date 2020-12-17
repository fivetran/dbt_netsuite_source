{% macro get_locations_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "address", "datatype": dbt_utils.type_string()},
    {"name": "address_one", "datatype": dbt_utils.type_string()},
    {"name": "address_three", "datatype": dbt_utils.type_string()},
    {"name": "address_two", "datatype": dbt_utils.type_string()},
    {"name": "addressee", "datatype": dbt_utils.type_string()},
    {"name": "attention", "datatype": dbt_utils.type_string()},
    {"name": "bill_com_last_updated_by_impo", "datatype": dbt_utils.type_string()},
    {"name": "branch_id", "datatype": dbt_utils.type_string()},
    {"name": "city", "datatype": dbt_utils.type_string()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_last_modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "inventory_available", "datatype": dbt_utils.type_string()},
    {"name": "inventory_available_web_store", "datatype": dbt_utils.type_string()},
    {"name": "is_include_in_supply_planning", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "location_extid", "datatype": dbt_utils.type_string()},
    {"name": "location_id", "datatype": dbt_utils.type_float()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent_id", "datatype": dbt_utils.type_float()},
    {"name": "phone", "datatype": dbt_utils.type_string()},
    {"name": "pick_up", "datatype": dbt_utils.type_string()},
    {"name": "return_address_one", "datatype": dbt_utils.type_string()},
    {"name": "return_address_two", "datatype": dbt_utils.type_string()},
    {"name": "return_city", "datatype": dbt_utils.type_string()},
    {"name": "return_country", "datatype": dbt_utils.type_string()},
    {"name": "return_state", "datatype": dbt_utils.type_string()},
    {"name": "return_zipcode", "datatype": dbt_utils.type_string()},
    {"name": "returnaddress", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "tran_num_prefix", "datatype": dbt_utils.type_string()},
    {"name": "use_bins", "datatype": dbt_utils.type_string()},
    {"name": "zipcode", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}
