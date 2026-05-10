WITH order_revenue AS (
    SELECT 
        order_id,
        SUM(payment_value::NUMERIC) AS revenue
    FROM olist_order_payments
    GROUP BY order_id
)

SELECT 
    order_id,
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS rank
FROM order_revenue;