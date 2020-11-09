
with payment as (
select orders.order_id, customers.customer_id, orders.order_date, sum(round(payment.amount/100, 2)) as amount_usd
from {{ ref('stg_orders') }} as orders
inner join {{ ref('stg_customers') }} as customers
on customers.customer_id = orders.customer_id
inner join raw.stripe.payment payment
on payment.orderid = orders.order_id
where payment.status = 'success'
group by orders.order_id, customers.customer_id, order_date
  )
select * from payment
