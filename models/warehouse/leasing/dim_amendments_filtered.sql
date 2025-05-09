with
    commercial_amendments as (
        select * from {{ ref("stg_datafreedom__df_global_amendment_commercial") }}
    )

select 
    *,
    case
        when created_date = max(created_date) over (partition by tenant_id)
        then cast(1 as boolean)
        else cast(0 as boolean)
    end as is_max_created_date
from commercial_amendments
where amendment_type not in ('Assignment', 'Modification', 'Proposal', 'Termination') and status not in ('Cancelled')
order by tenant_id, amendment_id