{% macro get_transactionaccountingline_columns() %}

{% set columns = [
    {"name": "_fivetran_deleted", "datatype": "boolean"},
    {"name": "_fivetran_synced", "datatype": dbt_utils.type_timestamp()},
    {"name": "account", "datatype": dbt_utils.type_int()},
    {"name": "accountingbook", "datatype": dbt_utils.type_int()},
    {"name": "amount", "datatype": dbt_utils.type_float()},
    {"name": "amountlinked", "datatype": dbt_utils.type_float()},
    {"name": "amountpaid", "datatype": dbt_utils.type_float()},
    {"name": "amountunpaid", "datatype": dbt_utils.type_float()},
    {"name": "credit", "datatype": dbt_utils.type_float()},
    {"name": "date_deleted", "datatype": dbt_utils.type_timestamp()},
    {"name": "debit", "datatype": dbt_utils.type_float()},
    {"name": "exchangerate", "datatype": dbt_utils.type_float()},
    {"name": "netamount", "datatype": dbt_utils.type_float()},
    {"name": "overheadparentitem", "datatype": dbt_utils.type_int()},
    {"name": "paymentamountunused", "datatype": dbt_utils.type_float()},
    {"name": "paymentamountused", "datatype": dbt_utils.type_float()},
    {"name": "posting", "datatype": dbt_utils.type_string()},
    {"name": "transaction", "datatype": dbt_utils.type_int()},
    {"name": "transactionline", "datatype": dbt_utils.type_int()}
] %}

{{ return(columns) }}

{% endmacro %}