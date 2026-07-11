{% set myname='Ankit' %}

my name is {{ myname }}

{% set my_toolkit =['SQL','Python','Snowflake','dbt'] %}

{#my_toolkit#}

{#my_toolkit[1]#}

{% for x in my_toolkit %}
        my favorite tool is {{ x }}
        this is iteration

{% endfor %}



{%- for x in my_toolkit -%}
        {%- if x == 'Python' -%}
            my favorite tool is {{ x }}
         {%- endif -%}
{%- endfor -%}




{% set ipl= { 
    'CSK':'chennai super kings',
    'MI':'mumbai indians'
} %}

{{ipl['CSK']}}