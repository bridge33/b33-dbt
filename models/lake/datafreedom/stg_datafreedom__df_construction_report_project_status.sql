with
    source as (
        select *
        from {{ source("datafreedom", "df_Construction_Report_Project_Status") }}
    ),
    renamed as (
        select
            {{ adapter.quote("as_of_month") }},
            {{ adapter.quote("property_code") }},
            {{ adapter.quote("property_name") }},
            {{ adapter.quote("property_id") }},
            {{ adapter.quote("category_tree_code") }},
            {{ adapter.quote("category_tree_name") }},
            {{ adapter.quote("category_tree_id") }},
            {{ adapter.quote("category_tree_detail_id") }},
            {{ adapter.quote("category_tree_detail_code") }},
            {{ adapter.quote("category_tree_detail_name") }},
            {{ adapter.quote("job_code") }},
            {{ adapter.quote("job_name") }},
            {{ adapter.quote("job_id") }},
            {{ adapter.quote("estimated_cost_budget_original") }},
            {{ adapter.quote("estimated_cost_budget_change") }},
            {{ adapter.quote("estimated_cost_budget_revised") }},
            {{ adapter.quote("committed_contracts") }},
            {{ adapter.quote("committed_spent") }},
            {{ adapter.quote("committed_to_complete") }},
            {{ adapter.quote("non_committed_budget") }},
            {{ adapter.quote("not_committed_spent") }},
            {{ adapter.quote("non_committed_to_complete") }},
            {{ adapter.quote("total_spent_to_date") }},
            {{ adapter.quote("total_spent_this_month") }},
            {{ adapter.quote("estimated_cost_at_completion") }},
            {{ adapter.quote("estimated_cost_to_complete") }},
            {{ adapter.quote("over_budget_amount") }},
            {{ adapter.quote("database_id") }},
            {{ adapter.quote("source_data_through") }}

        from source
    )
select *
from renamed
