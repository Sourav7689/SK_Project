{% set vv_extra_types=['legbyes','byes','wides'] %}
select 
filename,

{{dbt_utils.pivot('extra_type',vv_extra_types)}}

FROM {{ref('stg_match_innings')}}
group by 1

