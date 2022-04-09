
with orders as(
    select * from {{ ref('stg_orders') }}
),

payments as(
    select * from {{ ref('stg_payments') }}
),

final as(
select 
orders.order_id,
orders.customer_id,
orders.order_date,
sum(case when payments.order_status = 'success' then order_amount else 0 end) as order_amount
from orders 
left join payments using (order_id)
group by 1,2,3
)

select * from final