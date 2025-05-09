with
    properties as (select * from {{ ref("stg_datafreedom__df_global_property") }}),

    acquistion as (
        select *
        from
            {{
                ref(
                    "stg_datafreedom__df_custom_table_property_bridge33_custom_acq_table"
                )
            }}
    )

select p.*, a.colloquial_property_name
from properties p
left join acquistion a on p.property_id = a.property_id
