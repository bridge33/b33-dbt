with source as (select * from {{ source("deal_manager", "deal_manager_spaces") }})

select id, spaceguid, spacestatus, propertyguid, propertyname, propertycode, unitcode
from source
