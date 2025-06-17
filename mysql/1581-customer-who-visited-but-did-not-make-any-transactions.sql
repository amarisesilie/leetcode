SELECT customer_id, COUNT(*) as count_no_trans
FROM Visits V
LEFT JOIN Transactions T
ON V.visit_id = T.visit_id
WHERE transaction_id IS NULL
GROUP BY customer_id
