{{ config(enabled=var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2')) }}

{{
    fivetran_utils.union_data(
        table_identifier='location_main_address',
        database_variable='netsuite_database',
        schema_variable='netsuite_schema',
        default_database=target.database,
        default_schema='netsuite2',
        default_variable='netsuite2_location_main_address',
        union_schema_variable='netsuite2_union_schemas',
        union_database_variable='netsuite2_union_databases',
        connector_table_name_override='locationmainaddress'
    )
}}