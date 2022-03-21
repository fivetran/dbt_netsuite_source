{% macro get_consolidated_exchange_rates_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "accounting_book_id", "datatype": dbt_utils.type_float()},
    {"name": "accounting_period_id", "datatype": dbt_utils.type_float()},
    {"name": "average_budget_rate", "datatype": dbt_utils.type_float()},
    {"name": "average_rate", "datatype": dbt_utils.type_float()},
    {"name": "consolidated_exchange_rate_id", "datatype": dbt_utils.type_float()},
    {"name": "current_budget_rate", "datatype": dbt_utils.type_float()},
    {"name": "current_rate", "datatype": dbt_utils.type_float()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "from_subsidiary_id", "datatype": dbt_utils.type_float()},
    {"name": "historical_budget_rate", "datatype": dbt_utils.type_float()},
    {"name": "historical_rate", "datatype": dbt_utils.type_float()},
    {"name": "to_subsidiary_id", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_consolidated_exchange_rates_columns() %}

{% set columns = [
    {"name": "id", "datatype": dbt_utils.type_float()},
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "averagerate", "datatype": dbt_utils.type_float()},
    {"name": "currentrate", "datatype": dbt_utils.type_float()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "externalid", "datatype": dbt_utils.type_string()},
    {"name": "fromcurrency", "datatype": dbt_utils.type_float()},
    {"name": "fromsubsidiary", "datatype": dbt_utils.type_float()},
    {"name": "historicalrate", "datatype": dbt_utils.type_float()},
    {"name": "postingperiod", "datatype": dbt_utils.type_float()},
    {"name": "tocurrency", "datatype": dbt_utils.type_float()},
    {"name": "tosubsidiary", "datatype": dbt_utils.type_float()}
] %}

{{ return(columns) }}

{% endmacro %}
