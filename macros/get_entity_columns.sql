{% macro get_entity_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt.type_timestamp()},
    {"name": "altemail", "datatype": dbt.type_string()},
    {"name": "altname", "datatype": dbt.type_string()},
    {"name": "altphone", "datatype": dbt.type_string()},
    {"name": "comments", "datatype": dbt.type_string()},
    {"name": "contact", "datatype": dbt.type_int()},
    {"name": "customer", "datatype": dbt.type_int()},
    {"name": "date_deleted", "datatype": dbt.type_timestamp()},
    {"name": "datecreated", "datatype": dbt.type_timestamp()},
    {"name": "email", "datatype": dbt.type_string()},
    {"name": "employee", "datatype": dbt.type_int()},
    {"name": "entityid", "datatype": dbt.type_string()},
    {"name": "entitynumber", "datatype": dbt.type_int()},
    {"name": "entitytitle", "datatype": dbt.type_string()},
    {"name": "externalid", "datatype": dbt.type_string()},
    {"name": "fax", "datatype": dbt.type_string()},
    {"name": "firstname", "datatype": dbt.type_string()},
    {"name": "genericresource", "datatype": dbt.type_int()},
    {"name": "homephone", "datatype": dbt.type_string()},
    {"name": "id", "datatype": dbt.type_int()},
    {"name": "isinactive", "datatype": dbt.type_string()},
    {"name": "isperson", "datatype": dbt.type_string()},
    {"name": "laborcost", "datatype": dbt.type_float()},
    {"name": "lastmodifieddate", "datatype": dbt.type_timestamp()},
    {"name": "lastname", "datatype": dbt.type_string()},
    {"name": "middlename", "datatype": dbt.type_string()},
    {"name": "mobilephone", "datatype": dbt.type_string()},
    {"name": "othername", "datatype": dbt.type_int()},
    {"name": "parent", "datatype": dbt.type_int()},
    {"name": "partner", "datatype": dbt.type_int()},
    {"name": "phone", "datatype": dbt.type_string()},
    {"name": "project", "datatype": dbt.type_int()},
    {"name": "projecttemplate", "datatype": dbt.type_int()},
    {"name": "salutation", "datatype": dbt.type_string()},
    {"name": "title", "datatype": dbt.type_string()},
    {"name": "toplevelparent", "datatype": dbt.type_int()},
    {"name": "type", "datatype": dbt.type_string()},
    {"name": "vendor", "datatype": dbt.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}
