
{% macro pivot_columns(input_values,filter_column,agg_column,agg_function='sum') %}

{% for x in input_values %}
    ,{{ agg_function }} (case when {{ filter_column }} = '{{ x }}' then {{agg_column}} end ) as {{ x }}
{% endfor %}

{% endmacro %}