{%- set child_columns = adapter.get_columns_in_relation(
    ref("stg_datafreedom__df_global_customer")
) | map(attribute="name") -%}


with
    parent_customer as (
        select *
        from {{ ref("stg_datafreedom__df_global_customer") }}
        where parent_customer is null
    ),

    child_customer as (
        select *
        from {{ ref("stg_datafreedom__df_global_customer") }}
    )

select
    ifnull(parent_customer.code, child_customer.code) as parent_code,
    ifnull(regexp_replace(parent_customer.name, r'\s*\(Parent\)$', ''), child_customer.name) as parent_name,
    {% for col in child_columns %}
        child_customer.{{ col }} as child_{{ col }}{% if not loop.last %},{% endif %}
    {% endfor %}
from child_customer
left join parent_customer on child_customer.parent_customer = parent_customer.code
order by parent_customer.code, child_customer.code
