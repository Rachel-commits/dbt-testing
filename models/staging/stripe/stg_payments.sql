with payments as (
    select 
        id as id,
        orderid as order_id,
        paymentmethod as payment_method,
        status as order_status,
        amount/100 as order_amount,
        created as order_date

    from  {{ source('stripe', 'payment') }}
)

select * from payments