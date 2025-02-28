{% set my_metric_yml -%}

metrics:
  - name: develop_metric
    model: ref('orders')
    label: Total Discount ($)
    timestamp: order_date
    time_grains: [day, week, month]
    type: average
    sql: amount
    dimensions:
      - had_discount
      - order_country

{%- endset %}

select * 
from {{ metrics.develop(
        develop_yml=my_metric_yml,
        grain='month'
        )
    }}