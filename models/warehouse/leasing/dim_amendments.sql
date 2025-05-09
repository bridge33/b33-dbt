with
    commercial_amendments as (
        select * from {{ ref("stg_datafreedom__df_global_amendment_commercial") }}
    )

select *
from commercial_amendments
