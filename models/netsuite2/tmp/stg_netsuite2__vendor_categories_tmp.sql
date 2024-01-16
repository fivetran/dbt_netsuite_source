{{ config(enabled=(var('netsuite_data_model', 'netsuite') == var('netsuite_data_model_override','netsuite2') and var('netsuite2__using_vendor_categories', true))) }}

{{
    fivetran_utils.union_data(
        table_identifier='vendor_category',
        database_variable='netsuite_database',
        schema_variable='netsuite_schema',
        default_database=target.database,
        default_schema='netsuite2',
        default_variable='netsuite2_vendor_categories',
        union_schema_variable='netsuite2_union_schemas',
        union_database_variable='netsuite2_union_databases',
        connector_table_name_override='vendorcategory'
    )
}}