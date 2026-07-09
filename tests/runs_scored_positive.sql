select * 
from {{ ref('stg_match_innings') }}
where runs_batter<0