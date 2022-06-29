
with base as (

    select * 
    from {{ ref('stg_netsuite__vendorcategory_tmp') }}
),

fields as (

    select
        {{
            fivetran_utils.fill_staging_columns(
                source_columns=adapter.get_columns_in_relation(ref('stg_netsuite__vendorcategory_tmp')),
                staging_columns=get_vendorcategory_columns()
            )
        }}
    from base
),

final as (
    
    select
        id as vendor_category_id,
        name,
        _fivetran_synced

    from fields
    where not coalesce(_fivetran_deleted, false)
)

select *
from final
