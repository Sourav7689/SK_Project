{% snapshot snapshot_name %}
    {{
        config(
            unique_key='player_name',
            strategy='check',
            check_cols=['teams']
        )
    }}
select seq_players.nextval as player_id,*
from(
select p.player_name,array_agg(distinct t.team_id) as teams
from {{ ref('int_players') }} p
inner join {{ ref('teams') }} t on p.team_name=t.team
group by 1
)

{% endsnapshot %}
