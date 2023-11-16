-- I will be answering questions related to Pizza Place Sales
-- This Dataset was pulled from Maven Analytics


-- Pulling up the orders table
SELECT *
FROM dbo.orders;

--Pulling up the order_details table 
SELECT *
FROM dbo.order_details;

-- Joining order details and order tables
SELECT orders.order_id, 
orders.date, 
orders.time,
order_details.order_details_id, 
Order_details.pizza_id, 
Order_details.quantity
FROM dbo.orders AS Orders
JOIN dbo.order_details AS Order_details
ON Orders.order_id = Order_details.order_id
ORDER BY date DESC;

-- Joining the pizzas and pizza_types table
SELECT Type.pizza_type_id,Type.name, Type.category, Type.ingredients,Pizza.size, Pizza.price
FROM pizza_types AS Type
JOIN pizzas AS Pizza ON Type.pizza_type_id = Pizza.pizza_type_id;


-- Number of customers each day 
SELECT count(order_id)/count(distinct date) AS  '# of Customers per day'
FROM dbo.orders;

-- Number of pizzas typically in a order
SELECT count(order_details_id)/count(quantity) AS 'Average # of Pizza orders'
FROM dbo.orders AS Orders
JOIN dbo.order_details AS Order_details
ON Orders.order_id = Order_details.order_id;


-- Best sellers
SELECT pizza_type_id AS 'Pizza Type', COUNT(quantity) AS '# of orders'
FROM dbo.order_details AS Orders
JOIN dbo.pizzas AS pizza
ON Orders.pizza_id = pizza.pizza_id
GROUP BY pizza_type_id
ORDER BY [# of orders] DESC;

-- Total revenue for the year
SELECT ROUND(SUM(pizza.price * Order_details.quantity),2) AS 'Total Revenue'
FROM dbo.order_details 
JOIN dbo.pizzas AS pizza ON order_details.pizza_id = pizza.pizza_id
JOIN dbo.orders ON  Orders.order_id = order_details.order_id;

-- Peak Hours
SELECT SUM(OD.order_id * OD.quantity) AS orders, O.time
FROM dbo.order_details AS OD
JOIN dbo.orders AS O ON O.order_id = OD.order_id
JOIN dbo.pizzas AS Pizza ON OD.pizza_id = Pizza.pizza_id 
GROUP BY o.time
ORDER BY orders DESC;