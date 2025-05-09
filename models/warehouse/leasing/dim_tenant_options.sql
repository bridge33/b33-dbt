with
    commercial_tenants_options as (
        select * from {{ ref("stg_datafreedom__df_global_tenant_option_commercial") }}
    )

select *
from commercial_tenants_options
