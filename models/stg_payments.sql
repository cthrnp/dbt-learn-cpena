with payment as (
select orderid as order_id, id as payment_id, paymentmethod as payment_method, amount/100 as amount_usd, status
from raw.stripe.payment payment
  )
select * from payment
