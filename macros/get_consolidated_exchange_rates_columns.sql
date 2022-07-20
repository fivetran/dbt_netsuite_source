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

{{ fivetran_utils.add_pass_through_columns(columns, var('consolidated_exchange_rates_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}

{% macro get_netsuite2_consolidated_exchange_rates_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "averagerate", "datatype": dbt_utils.type_float()},
    {"name": "currentrate", "datatype": dbt_utils.type_float()},
    {"name": "fromcurrency", "datatype": dbt_utils.type_int()},
    {"name": "fromsubsidiary", "datatype": dbt_utils.type_int()},
    {"name": "historicalrate", "datatype": dbt_utils.type_float()},
    {"name": "id", "datatype": dbt_utils.type_int()},
    {"name": "postingperiod", "datatype": dbt_utils.type_int()},
    {"name": "tocurrency", "datatype": dbt_utils.type_int()},
    {"name": "tosubsidiary", "datatype": dbt_utils.type_int()}
] %}

{{ fivetran_utils.add_pass_through_columns(columns, var('consolidated_exchange_rates_pass_through_columns')) }}

{{ return(columns) }}

{% endmacro %}
