with
    commercial_tenants as (
        select * from {{ ref("stg_datafreedom__df_global_tenant_commercial") }}
    )

select *
from commercial_tenants
