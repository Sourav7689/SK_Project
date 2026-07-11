{% set vv_extra_types=['legbyes','byes','wides'] %}
select 
filename

{{pivot_columns(vv_extra_types,'extra_type','runs_extras')}}

FROM {{ref('stg_match_innings')}}
group by 1
