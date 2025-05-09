with source as (
    select * from {{ source('datafreedom', 'df_global_tenant_sales_by_month_commercial') }}
)

select 
    property_id,
    property_code,
    property_name,
    tenant_id,
    tenant_code,
    tenant_name,
    month,
    sales_type_id,
    sales_type_code,
    sales_type_description,
    sales_group_id,
    sales_group_code,
    sales_group_description,
    sales_report_frequency,
    billing_frequency,
    breakpoint_frequency,
    sales_end_of_year_month,
    mtd_sales___estimated,
    mtd_sales___actual,
    mtd_sales___audited,
    mtd_sales___hierarchical,
    ytd_sales___estimated,
    ytd_sales___actual,
    ytd_sales___audited,
    ytd_sales___hierarchical,
    rolling_12_month_sales___estimated,
    rolling_12_month_sales___actual,
    rolling_12_month_sales___audited,
    rolling_12_month_sales___hierarchical,
    database_id,
    source_data_through
from source
