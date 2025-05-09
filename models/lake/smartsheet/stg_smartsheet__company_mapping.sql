with source as (
        select * from {{ source('datafreedom', 'company_mapping') }}
  ),
  renamed as (
      select
        {{ adapter.quote("code") }},
        {{ adapter.quote("name") }},
        {{ adapter.quote("company_name") }},
        {{ adapter.quote("modified_by") }},
        {{ adapter.quote("modification_date") }}

      from source
  )
  select * from renamed