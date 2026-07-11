{{
    config(
        materialized='incremental'
    )
}}

select seq_teams.nextval as team_id, * 
from {{ ref('int_team') }}
{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where team not in (select team from {{this}})
{% endif %}