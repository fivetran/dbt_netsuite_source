{{ config(enabled=var('data_model', 'netsuite') == 'netsuite2') }}

with base as (

    select * 
    from {{ ref('stg_netsuite__accountingbooksubsidiaries_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__accountingbooksubsidiaries_tmp')),
                staging_columns=get_accountingbooksubsidiaries_columns()
            )
        }}
    from base
),

final as (
    
    select 
        _fivetran_id,
        _fivetran_synced,
        accountingbook as accounting_book_id,
        status,
        subsidiary as subsidiary_id

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final