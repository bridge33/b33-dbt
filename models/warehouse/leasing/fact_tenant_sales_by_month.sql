with
    tenant_sales_by_month as (
        select *, date_trunc('month', current_date()) as first_of_month
        from {{ ref("stg_datafreedom__df_global_tenant_sales_by_month_commercial") }}
    )

select
    tenant_id, rolling_12_month_sales___actual as current_months_12_month_sales___actual
from tenant_sales_by_month
where month = first_of_month
