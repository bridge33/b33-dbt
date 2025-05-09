with
    source as (
        select * from {{ source("datafreedom", "df_global_property_list_xref") }}
    ),
    renamed as (
        select
            property_id,
            property_code,
            property_name,
            property_list_id,
            property_list_code,
            property_list_name,
            property_list_percent,
            voyager_url,
            database_id,
            source_data_through

        from source
    )
select *
from renamed
