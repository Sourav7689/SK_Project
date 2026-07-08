{{
    config(
        materialized='table'
    )
}}

SELECT 
F0.VALUE :: STRING AS TEAM
,raw_file:info:team_type :: STRING AS TEAM_TYPE
FROM {{ ref('cricket_raw_data') }}
,LATERAL FLATTEN(raw_file:info:teams)F0
GROUP BY ALL