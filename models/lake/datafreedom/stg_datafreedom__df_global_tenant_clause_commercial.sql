with source as (
    select * from {{ source('datafreedom', 'df_global_tenant_clause_commercial') }}
)

select 
    tenant_id,
    tenant_code,
    tenant_name,
    commercial_clause_id,
    commercial_clause_type_id,
    property_id,
    property_code,
    property_name,
    amendment_id,
    amendment_status,
    amendment_type,
    amendment_start_date,
    amendment_end_date,
    amendment_sequence,
    amendment_description,
    name,
    description,
    reference,
    clause_date,
    unit_id,
    unit_code,
    voyager_url,
    database_id,
    source_data_through
from source
