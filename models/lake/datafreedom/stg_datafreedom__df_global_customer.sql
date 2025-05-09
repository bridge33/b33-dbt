with source as (
    select * from {{ source('datafreedom', 'df_global_customer') }}
)

select 
    customer_id,
    code,
    name,
    type,
    status,
    parent_customer,
    country,
    sales_category_code,
    sales_category_description,
    tax_registration_number,
    tax_authority_code,
    tax_authority_description,
    notes,
    primary_contact_name,
    primary_contact_company,
    primary_contact_address,
    primary_contact_city,
    primary_contact_state,
    primary_contact_postal_code,
    primary_contact_country,
    primary_contact_email,
    primary_contact_phone_0,
    voyager_url,
    database_id,
    source_data_through
from source
