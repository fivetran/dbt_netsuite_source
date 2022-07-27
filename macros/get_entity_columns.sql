{% macro get_entity_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "altemail", "datatype": dbt_utils.type_string()},
    {"name": "altname", "datatype": dbt_utils.type_string()},
    {"name": "altphone", "datatype": dbt_utils.type_string()},
    {"name": "comments", "datatype": dbt_utils.type_string()},
    {"name": "contact", "datatype": dbt_utils.type_int()},
    {"name": "customer", "datatype": dbt_utils.type_int()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "datecreated", "datatype": dbt_utils.type_timestamp()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "employee", "datatype": dbt_utils.type_int()},
    {"name": "entityid", "datatype": dbt_utils.type_string()},
    {"name": "entitynumber", "datatype": dbt_utils.type_int()},
    {"name": "entitytitle", "datatype": dbt_utils.type_string()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "fax", "datatype": dbt_utils.type_string()},
    {"name": "firstname", "datatype": dbt_utils.type_string()},
    {"name": "genericresource", "datatype": dbt_utils.type_int()},
    {"name": "homephone", "datatype": dbt_utils.type_string()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "isinactive", "datatype": dbt_utils.type_string()},
    {"name": "isperson", "datatype": dbt_utils.type_string()},
    {"name": "laborcost", "datatype": dbt_utils.type_float()},
    {"name": "lastmodifieddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "lastname", "datatype": dbt_utils.type_string()},
    {"name": "middlename", "datatype": dbt_utils.type_string()},
    {"name": "mobilephone", "datatype": dbt_utils.type_string()},
    {"name": "othername", "datatype": dbt_utils.type_int()},
    {"name": "parent", "datatype": dbt_utils.type_int()},
    {"name": "partner", "datatype": dbt_utils.type_int()},
    {"name": "phone", "datatype": dbt_utils.type_string()},
    {"name": "project", "datatype": dbt_utils.type_int()},
    {"name": "projecttemplate", "datatype": dbt_utils.type_int()},
    {"name": "salutation", "datatype": dbt_utils.type_string()},
    {"name": "title", "datatype": dbt_utils.type_string()},
    {"name": "toplevelparent", "datatype": dbt_utils.type_int()},
    {"name": "type", "datatype": dbt_utils.type_string()},
    {"name": "vendor", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
