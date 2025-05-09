with
    source as (
        select * from {{ source("datafreedom", "df_Construction_Job_Forecast") }}
    ),
    renamed as (
        select
            {{ adapter.quote("job_id") }},
            {{ adapter.quote("job_code") }},
            {{ adapter.quote("job_name") }},
            {{ adapter.quote("property_id") }},
            {{ adapter.quote("property_code") }},
            {{ adapter.quote("property_name") }},
            {{ adapter.quote("category_id") }},
            {{ adapter.quote("category_code") }},
            {{ adapter.quote("category_description") }},
            {{ adapter.quote("forecast_number") }},
            {{ adapter.quote("forecast_header_post_month") }},
            {{ adapter.quote("forecast_status") }},
            {{ adapter.quote("is_latest_posted_forecast") }},
            {{ adapter.quote("month") }},
            {{ adapter.quote("forecast_monthly_amount") }},
            {{ adapter.quote("is_actuals") }},
            {{ adapter.quote("voyager_url") }},
            {{ adapter.quote("construction_manager_url") }},
            {{ adapter.quote("database_id") }},
            {{ adapter.quote("source_data_through") }}

        from source
    )
select *
from renamed
