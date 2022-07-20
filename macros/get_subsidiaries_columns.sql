{% macro get_subsidiaries_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "address", "datatype": dbt_utils.type_string()},
    {"name": "address1", "datatype": dbt_utils.type_string()},
    {"name": "address2", "datatype": dbt_utils.type_string()},
    {"name": "base_currency_id", "datatype": dbt_utils.type_float()},
    {"name": "branch_id", "datatype": dbt_utils.type_string()},
    {"name": "brn", "datatype": dbt_utils.type_string()},
    {"name": "city", "datatype": dbt_utils.type_string()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "date_last_modified", "datatype": dbt_utils.type_timestamp()},
    {"name": "edition", "datatype": dbt_utils.type_string()},
    {"name": "federal_number", "datatype": dbt_utils.type_string()},
    {"name": "fiscal_calendar_id", "datatype": dbt_utils.type_float()},
    {"name": "full_name", "datatype": dbt_utils.type_string()},
    {"name": "is_elimination", "datatype": dbt_utils.type_string()},
    {"name": "is_moss", "datatype": dbt_utils.type_string()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "isinactive_bool", "datatype": dbt_utils.type_string()},
    {"name": "legal_name", "datatype": dbt_utils.type_string()},
    {"name": "moss_nexus_id", "datatype": dbt_utils.type_float()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "parent_id", "datatype": dbt_utils.type_float()},
    {"name": "purchaseorderamount", "datatype": dbt_utils.type_float()},
    {"name": "purchaseorderquantity", "datatype": dbt_utils.type_float()},
    {"name": "purchaseorderquantitydiff", "datatype": dbt_utils.type_float()},
    {"name": "receiptamount", "datatype": dbt_utils.type_float()},
    {"name": "receiptquantity", "datatype": dbt_utils.type_float()},
    {"name": "receiptquantitydiff", "datatype": dbt_utils.type_float()},
    {"name": "return_address", "datatype": dbt_utils.type_string()},
    {"name": "return_address1", "datatype": dbt_utils.type_string()},
    {"name": "return_address2", "datatype": dbt_utils.type_string()},
    {"name": "return_city", "datatype": dbt_utils.type_string()},
    {"name": "return_country", "datatype": dbt_utils.type_string()},
    {"name": "return_state", "datatype": dbt_utils.type_string()},
    {"name": "return_zipcode", "datatype": dbt_utils.type_string()},
    {"name": "shipping_address", "datatype": dbt_utils.type_string()},
    {"name": "shipping_address1", "datatype": dbt_utils.type_string()},
    {"name": "shipping_address2", "datatype": dbt_utils.type_string()},
    {"name": "shipping_city", "datatype": dbt_utils.type_string()},
    {"name": "shipping_country", "datatype": dbt_utils.type_string()},
    {"name": "shipping_state", "datatype": dbt_utils.type_string()},
    {"name": "shipping_zipcode", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "state_tax_number", "datatype": dbt_utils.type_string()},
    {"name": "subnav__searchable_subsidiary", "datatype": dbt_utils.type_float()},
    {"name": "subsidiary_extid", "datatype": dbt_utils.type_string()},
    {"name": "subsidiary_id", "datatype": dbt_utils.type_float()},
    {"name": "taxonomy_reference_id", "datatype": dbt_utils.type_float()},
    {"name": "tran_num_prefix", "datatype": dbt_utils.type_string()},
    {"name": "uen", "datatype": dbt_utils.type_string()},
    {"name": "url", "datatype": dbt_utils.type_string()},
    {"name": "zipcode", "datatype": dbt_utils.type_string()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('subsidiaries_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_subsidiaries_columns() %}

{% set columns = [
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "name", "datatype": dbt_utils.type_string()},
    {"name": "fullname", "datatype": dbt_utils.type_string()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "mainaddress", "datatype": dbt_utils.type_int()},
    {"name": "country", "datatype": dbt_utils.type_string()},
    {"name": "state", "datatype": dbt_utils.type_string()},
    {"name": "fiscalcalendar", "datatype": dbt_utils.type_int()},
    {"name": "parent", "datatype": dbt_utils.type_int()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('subsidiaries_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}
