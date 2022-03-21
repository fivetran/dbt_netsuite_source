{% macro get_transactions_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "accounting_period_id", "datatype": dbt_utils.type_float()},
    {"name": "currency_id", "datatype": dbt_utils.type_float()},
    {"name": "due_date", "datatype": dbt_utils.type_timestamp()},
    {"name": "is_advanced_intercompany", "datatype": dbt_utils.type_string()},
    {"name": "is_intercompany", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "trandate", "datatype": dbt_utils.type_timestamp()},
    {"name": "transaction_id", "datatype": dbt_utils.type_float()},
    {"name": "transaction_type", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_transactions_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_float()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "billingaddress", "datatype": dbt_utils.type_float()},
    {"name": "closedate", "datatype": dbt_utils.type_timestamp()},
    {"name": "createddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "currency", "datatype": dbt_utils.type_float()},
    {"name": "duedate", "datatype": dbt_utils.type_timestamp()},
    {"name": "email", "datatype": dbt_utils.type_string()},
    {"name": "entity", "datatype": dbt_utils.type_float()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "intercoadj", "datatype": dbt_utils.type_string()},
    {"name": "isfinchrg", "datatype": dbt_utils.type_string()},
    {"name": "isreversal", "datatype": dbt_utils.type_string()},
    {"name": "lastmodifieddate", "datatype": dbt_utils.type_timestamp()},
    {"name": "memo", "datatype": dbt_utils.type_string()},
    {"name": "posting", "datatype": dbt_utils.type_string()},
    {"name": "postingperiod", "datatype": dbt_utils.type_float()},
    {"name": "shippingaddress", "datatype": dbt_utils.type_float()},
    {"name": "source", "datatype": dbt_utils.type_string()},
    {"name": "status", "datatype": dbt_utils.type_string()},
    {"name": "terms", "datatype": dbt_utils.type_float()},
    {"name": "trandate", "datatype": dbt_utils.type_timestamp()},
    {"name": "type", "datatype": dbt_utils.type_string()}
] %}

{{ return(columns) }}

{% endmacro %}