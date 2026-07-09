select raw_file:info.match_type::string as match_type
  ,raw_file:info.gender::string as gender
  ,raw_file:info.season::string as season
  ,raw_file:info.city::string as city
  ,raw_file:info.venue::string as venue
  ,raw_file:info.dates[0]::date as match_date
  ,raw_file:info.teams[0]::string  as team1
  ,raw_file:info.teams[1]::string  as team2
  ,raw_file:info.toss.winner::string as toss_winner
  ,raw_file:info.toss.decision::string as toss_decision
  ,raw_file:info.outcome.winner::string as match_winner
  ,case when raw_file:info.outcome.by.wickets::string is not null then raw_file:info.outcome.by.wickets::string||' wickets' 
    when raw_file:info.outcome.by.runs::string is not null then raw_file:info.outcome.by.runs::string||' runs' 
    else 'no result'
    end as margin
  ,raw_file:info.event.name::string as event_name
  ,raw_file:info.team_type::string as event_type
  ,raw_file:info.player_of_match[0]::string as pom
  ,filename  
from {{ ref('cricket_raw_data') }} 
