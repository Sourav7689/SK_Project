Select player_name,team_name
 from {{ ref('int_players') }}
 group by player_name,team_name
 having count(*)>1