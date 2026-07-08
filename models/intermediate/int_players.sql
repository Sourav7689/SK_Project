with cte as

(SELECT 
m.value :: string as Player_id
,p.VALUE :: STRING AS PLAYER_Name
,f.KEY :: STRING AS TEAM_NAME

--,raw_file:info:team_type :: STRING AS TEAM_TYPE
FROM {{ ref('cricket_raw_data') }} S
    ,LATERAL FLATTEN(
        INPUT => s.raw_file:info:players
    ) f
    ,LATERAL FLATTEN(
        INPUT => f.VALUE
    ) p
    ,lateral flatten ( input => s.raw_file:info:registry:people) m
    where p.value::string=m.key::string
GROUP BY ALL)

select c.* ,
        date_of_birth,
        gender,
        batting_style,
        bowling_style,
        position
from cte c
left join {{ ref('PLAYER_INFO') }} pi
on pi.name=c.PLAYER_Name
