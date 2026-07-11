-- select filename,extra_type,sum(runs_extras) as total_extras
-- FROM {{ref('stg_match_innings')}}
-- group by 1,2


select 
filename,
sum(case when extra_type='legbyes' then runs_extras end) as legbyes_runs
,sum(case when extra_type='byes' then runs_extras end) as byes_runs
,sum(case when extra_type='wides' then runs_extras end) as wides_runs

FROM {{ref('stg_match_innings')}}
group by 1


select 
filename,

{% set vv_extra_types=['legbyes','byes','wides'] %}
{% for x in vv_extra_types %}
    ,sum(case when extra_type='{{ x }}' then runs_extras end) as x_runs

{% endfor %}

FROM {{ref('stg_match_innings')}}
group by 1

