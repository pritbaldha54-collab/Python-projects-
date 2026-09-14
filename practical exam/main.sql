CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- ============================================================
-- 1. DATABASE SCHEMA
-- ============================================================

-- ------------------------------------------------------------
-- Table: Categories
-- ------------------------------------------------------------
CREATE TABLE categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL UNIQUE
);

-- ------------------------------------------------------------
-- Table: Products
-- ------------------------------------------------------------
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL CHECK (price >= 0),
    stock_quantity INT NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    added_date DATE NOT NULL,
    CONSTRAINT fk_products_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);

-- ------------------------------------------------------------
-- Table: Customers
-- ------------------------------------------------------------
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone_number VARCHAR(20),
    address VARCHAR(255),
    registration_date DATE NOT NULL
);

-- ------------------------------------------------------------
-- Table: Orders
-- ------------------------------------------------------------
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    total_amount DECIMAL(12, 2) NOT NULL CHECK (total_amount >= 0),
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') NOT NULL DEFAULT 'Pending',
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

-- ------------------------------------------------------------
-- Table: Order_Items
-- ------------------------------------------------------------
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    subtotal DECIMAL(12, 2) NOT NULL CHECK (subtotal >= 0),
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- ------------------------------------------------------------
-- Table: Payments
-- ------------------------------------------------------------
CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_method ENUM('Credit Card', 'PayPal', 'UPI') NOT NULL,
    payment_status ENUM('Paid', 'Pending', 'Failed') NOT NULL,
    CONSTRAINT fk_payments_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- ------------------------------------------------------------
-- Table: Shipping
-- ------------------------------------------------------------
CREATE TABLE shipping (
    shipping_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    shipping_date DATE,
    delivery_date DATE,
    shipping_status ENUM('Dispatched', 'In Transit', 'Delivered') NOT NULL,
    CONSTRAINT fk_shipping_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);




-- ============================================================
-- 2. INSERT SAMPLE DATA
-- ============================================================

-- ------------------------------------------------------------
-- Categories
-- ------------------------------------------------------------
INSERT INTO categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Home & Kitchen'),
('Books'),
('Sports');

-- ------------------------------------------------------------
-- Customers
-- Includes one NULL email for COALESCE() practice.
-- ------------------------------------------------------------
INSERT INTO customers
    (customer_id, name, email, phone_number, address, registration_date)
VALUES
    (1, '  Aarav Patel  ', 'aarav@example.com', '9876500001', 'Ahmedabad, Gujarat', '2021-06-15'),
    (2, '  Diya Shah ', 'diya@example.com', '9876500002', 'Surat, Gujarat', '2022-03-20'),
    (3, 'Rohan Mehta', 'rohan@example.com', '9876500003', 'Vadodara, Gujarat', '2022-11-10'),
    (4, '  Kavya Joshi  ', NULL, '9876500004', 'Rajkot, Gujarat', '2023-01-05'),
    (5, 'Vivaan Desai', 'vivaan@example.com', '9876500005', 'Mumbai, Maharashtra', '2023-07-18'),
    (6, 'Ishita Patel', 'ishita@example.com', '9876500006', 'Pune, Maharashtra', '2024-02-12'),
    (7, 'Arjun Trivedi', 'arjun@example.com', '9876500007', 'Ahmedabad, Gujarat', '2024-08-25'),
    (8, 'Meera Shah', 'meera@example.com', '9876500008', 'Surat, Gujarat', '2025-01-14'),
    (9, 'Kabir Modi', 'kabir@example.com', '9876500009', 'Nashik, Maharashtra', '2025-05-22'),
    (10, 'Anaya Patel', 'anaya@example.com', '9876500010', 'Gandhinagar, Gujarat', '2026-01-09'),
    (11, 'Neel Verma', 'neel@example.com', '9876500011', 'Jaipur, Rajasthan', '2026-02-15'),
    (12, 'Sara Khan', 'sara@example.com', '9876500012', 'Indore, Madhya Pradesh', '2026-04-03');

-- ------------------------------------------------------------
-- Products
-- Quantities are deliberately large enough for CASE practice.
-- ------------------------------------------------------------
INSERT INTO products
    (product_id, name, category_id, price, stock_quantity, added_date)
VALUES
    (1, 'Wireless Headphones', 1, 2499.00, 850, '2025-01-10'),
    (2, 'Smart Watch', 1, 4999.00, 650, '2025-01-20'),
    (3, 'Bluetooth Speaker', 1, 1999.00, 500, '2025-02-05'),
    (4, 'Mechanical Keyboard', 1, 3499.00, 250, '2025-03-12'),
    (5, 'Cotton T-Shirt', 2, 799.00, 300, '2025-01-25'),
    (6, 'Denim Jacket', 2, 2499.00, 180, '2025-04-10'),
    (7, 'Running Shoes', 5, 2999.00, 450, '2025-02-18'),
    (8, 'Yoga Mat', 5, 999.00, 600, '2025-03-01'),
    (9, 'Coffee Maker', 3, 5499.00, 120, '2025-05-08'),
    (10, 'Non Stick Cookware Set', 3, 3999.00, 150, '2025-06-14'),
    (11, 'The Data Science Handbook', 4, 1299.00, 220, '2025-01-30'),
    (12, 'Python Programming Guide', 4, 999.00, 200, '2025-02-22'),
    (13, 'Travel Backpack', 2, 1899.00, 275, '2025-07-05'),
    (14, 'Smartphone Stand', 1, 599.00, 700, '2025-07-15'),
    (15, 'Digital Camera', 1, 24999.00, 50, '2025-08-01');

-- ------------------------------------------------------------
-- Orders
-- ------------------------------------------------------------
INSERT INTO orders
    (order_id, customer_id, order_date, total_amount, status)
VALUES
    (1, 1, '2025-01-15', 7497.00, 'Delivered'),
    (2, 1, '2025-03-12', 9998.00, 'Delivered'),
    (3, 1, '2025-07-20', 14997.00, 'Delivered'),
    (4, 2, '2025-02-10', 5499.00, 'Delivered'),
    (5, 2, '2025-08-05', 7998.00, 'Shipped'),
    (6, 3, '2025-05-18', 10497.00, 'Delivered'),
    (7, 3, '2026-01-12', 2499.00, 'Delivered'),
    (8, 4, '2025-06-25', 8998.00, 'Delivered'),
    (9, 5, '2025-09-10', 14997.00, 'Delivered'),
    (10, 5, '2026-02-18', 19996.00, 'Delivered'),
    (11, 6, '2025-11-20', 9999.00, 'Delivered'),
    (12, 6, '2026-03-15', 12495.00, 'Shipped'),
    (13, 7, '2026-04-10', 5998.00, 'Delivered'),
    (14, 7, '2026-07-22', 24999.00, 'Pending'),
    (15, 8, '2026-05-05', 11997.00, 'Delivered'),
    (16, 8, '2026-08-18', 2499.00, 'Pending'),
    (17, 9, '2026-06-14', 3999.00, 'Delivered'),
    (18, 10, '2026-07-30', 4999.00, 'Delivered'),
    (19, 11, '2026-08-05', 1899.00, 'Delivered'),
    (20, 12, '2026-08-25', 6998.00, 'Pending');

-- ------------------------------------------------------------
-- Order Items
-- ------------------------------------------------------------
INSERT INTO order_items
    (order_item_id, order_id, product_id, quantity, subtotal)
VALUES
    (1,  1, 1, 3, 7497.00),
    (2,  2, 2, 2, 9998.00),
    (3,  3, 2, 3, 14997.00),
    (4,  4, 9, 1, 5499.00),
    (5,  5, 3, 4, 7996.00),
    (6,  6, 7, 3, 8997.00),
    (7,  6, 8, 1, 999.00),
    (8,  6, 14, 1, 599.00),
    (9,  7, 1, 1, 2499.00),
    (10, 8, 10, 2, 7998.00),
    (11, 9, 2, 3, 14997.00),
    (12, 10, 15, 1, 24999.00),
    (13, 11, 4, 2, 6998.00),
    (14, 11, 11, 1, 1299.00),
    (15, 11, 12, 1, 999.00),
    (16, 12, 9, 1, 5499.00),
    (17, 12, 6, 1, 2499.00),
    (18, 12, 8, 1, 999.00),
    (19, 12, 13, 1, 1899.00),
    (20, 13, 7, 2, 5998.00),
    (21, 14, 15, 1, 24999.00),
    (22, 15, 2, 2, 9998.00),
    (23, 15, 1, 1, 1999.00),
    (24, 16, 1, 1, 2499.00),
    (25, 17, 10, 1, 3999.00),
    (26, 18, 2, 1, 4999.00),
    (27, 19, 13, 1, 1899.00),
    (28, 20, 3, 2, 3998.00),
    (29, 20, 14, 5, 2995.00);

-- ------------------------------------------------------------
-- Payments
-- ------------------------------------------------------------
INSERT INTO payments
    (payment_id, order_id, payment_date, payment_method, payment_status)
VALUES
    (1,  1, '2025-01-15', 'UPI',         'Paid'),
    (2,  2, '2025-03-12', 'Credit Card', 'Paid'),
    (3,  3, '2025-07-20', 'UPI',         'Paid'),
    (4,  4, '2025-02-10', 'PayPal',      'Paid'),
    (5,  5, '2025-08-05', 'UPI',         'Paid'),
    (6,  6, '2025-05-18', 'Credit Card', 'Paid'),
    (7,  7, '2026-01-12', 'UPI',         'Paid'),
    (8,  8, '2025-06-25', 'Credit Card', 'Paid'),
    (9,  9, '2025-09-10', 'UPI',         'Paid'),
    (10, 10, '2026-02-18', 'Credit Card', 'Paid'),
    (11, 11, '2025-11-20', 'PayPal',      'Paid'),
    (12, 12, '2026-03-15', 'UPI',         'Paid'),
    (13, 13, '2026-04-10', 'UPI',         'Paid'),
    (14, 14, '2026-07-22', 'Credit Card', 'Pending'),
    (15, 15, '2026-05-05', 'UPI',         'Paid'),
    (16, 16, '2026-08-18', 'UPI',         'Pending'),
    (17, 17, '2026-06-14', 'PayPal',      'Paid'),
    (18, 18, '2026-07-30', 'Credit Card', 'Paid'),
    (19, 19, '2026-08-05', 'UPI',         'Paid'),
    (20, 20, '2026-08-25', 'UPI',         'Pending');

-- ------------------------------------------------------------
-- Shipping
-- ------------------------------------------------------------
INSERT INTO shipping
    (shipping_id, order_id, shipping_date, delivery_date, shipping_status)
VALUES
    (1,  1, '2025-01-16', '2025-01-20', 'Delivered'),
    (2,  2, '2025-03-13', '2025-03-18', 'Delivered'),
    (3,  3, '2025-07-21', '2025-07-25', 'Delivered'),
    (4,  4, '2025-02-11', '2025-02-15', 'Delivered'),
    (5,  5, '2025-08-06', NULL,         'In Transit'),
    (6,  6, '2025-05-19', '2025-05-24', 'Delivered'),
    (7,  7, '2026-01-13', '2026-01-17', 'Delivered'),
    (8,  8, '2025-06-26', '2025-06-30', 'Delivered'),
    (9,  9, '2025-09-11', '2025-09-16', 'Delivered'),
    (10, 10, '2026-02-19', '2026-02-24', 'Delivered'),
    (11, 11, '2025-11-21', '2025-11-26', 'Delivered'),
    (12, 12, '2026-03-16', NULL,         'In Transit'),
    (13, 13, '2026-04-11', '2026-04-15', 'Delivered'),
    (14, 14, NULL,         NULL,         'In Transit'),
    (15, 15, '2026-05-06', '2026-05-10', 'Delivered'),
    (16, 16, NULL,         NULL,         'In Transit'),
    (17, 17, '2026-06-15', '2026-06-19', 'Delivered'),
    (18, 18, '2026-07-31', '2026-08-04', 'Delivered'),
    (19, 19, '2026-08-06', '2026-08-10', 'Delivered'),
    (20, 20, NULL,         NULL,         'In Transit');

-- ============================================================
-- 3. VERIFY INSERTED DATA
-- ============================================================

SELECT * FROM categories;
-- +-------------+----------------+
-- | category_id | category_name  |
-- +-------------+----------------+
-- |           4 | Books          |
-- |           2 | Clothing       |
-- |           1 | Electronics    |
-- |           3 | Home & Kitchen |
-- |           5 | Sports         |
-- +-------------+----------------+

SELECT * FROM products;
-- +------------+---------------------------+-------------+----------+----------------+------------+
-- | product_id | name                      | category_id | price    | stock_quantity | added_date |
-- +------------+---------------------------+-------------+----------+----------------+------------+
-- |          1 | Wireless Headphones       |           1 |  2499.00 |            850 | 2025-01-10 |
-- |          2 | Smart Watch               |           1 |  4999.00 |            650 | 2025-01-20 |
-- |          3 | Bluetooth Speaker         |           1 |  1999.00 |            500 | 2025-02-05 |
-- |          4 | Mechanical Keyboard       |           1 |  3499.00 |            250 | 2025-03-12 |
-- |          5 | Cotton T-Shirt            |           2 |   799.00 |            300 | 2025-01-25 |
-- |          6 | Denim Jacket              |           2 |  2499.00 |            180 | 2025-04-10 |
-- |          7 | Running Shoes             |           5 |  2999.00 |            450 | 2025-02-18 |
-- |          8 | Yoga Mat                  |           5 |   999.00 |            600 | 2025-03-01 |
-- |          9 | Coffee Maker              |           3 |  5499.00 |            120 | 2025-05-08 |
-- |         10 | Non Stick Cookware Set    |           3 |  3999.00 |            150 | 2025-06-14 |
-- |         11 | The Data Science Handbook |           4 |  1299.00 |            220 | 2025-01-30 |
-- |         12 | Python Programming Guide  |           4 |   999.00 |            200 | 2025-02-22 |
-- |         13 | Travel Backpack           |           2 |  1899.00 |            275 | 2025-07-05 |
-- |         14 | Smartphone Stand          |           1 |   599.00 |            700 | 2025-07-15 |
-- |         15 | Digital Camera            |           1 | 24999.00 |             50 | 2025-08-01 |
-- +------------+---------------------------+-------------+----------+----------------+------------+

SELECT * FROM customers;
-- +-------------+-----------------+--------------------+--------------+------------------------+-------------------+
-- | customer_id | name            | email              | phone_number | address                | registration_date |
-- +-------------+-----------------+--------------------+--------------+------------------------+-------------------+
-- |           1 |   Aarav Patel   | aarav@example.com  | 9876500001   | Ahmedabad, Gujarat     | 2021-06-15        |
-- |           2 |   Diya Shah     | diya@example.com   | 9876500002   | Surat, Gujarat         | 2022-03-20        |
-- |           3 | Rohan Mehta     | rohan@example.com  | 9876500003   | Vadodara, Gujarat      | 2022-11-10        |
-- |           4 |   Kavya Joshi   | NULL               | 9876500004   | Rajkot, Gujarat        | 2023-01-05        |
-- |           5 | Vivaan Desai    | vivaan@example.com | 9876500005   | Mumbai, Maharashtra    | 2023-07-18        |
-- |           6 | Ishita Patel    | ishita@example.com | 9876500006   | Pune, Maharashtra      | 2024-02-12        |
-- |           7 | Arjun Trivedi   | arjun@example.com  | 9876500007   | Ahmedabad, Gujarat     | 2024-08-25        |
-- |           8 | Meera Shah      | meera@example.com  | 9876500008   | Surat, Gujarat         | 2025-01-14        |
-- |           9 | Kabir Modi      | kabir@example.com  | 9876500009   | Nashik, Maharashtra    | 2025-05-22        |
-- |          10 | Anaya Patel     | anaya@example.com  | 9876500010   | Gandhinagar, Gujarat   | 2026-01-09        |
-- |          11 | Neel Verma      | neel@example.com   | 9876500011   | Jaipur, Rajasthan      | 2026-02-15        |
-- |          12 | Sara Khan       | sara@example.com   | 9876500012   | Indore, Madhya Pradesh | 2026-04-03        |
-- +-------------+-----------------+--------------------+--------------+------------------------+-------------------+

SELECT * FROM orders;
-- +----------+-------------+------------+--------------+-----------+
-- | order_id | customer_id | order_date | total_amount | status    |
-- +----------+-------------+------------+--------------+-----------+
-- |        1 |           1 | 2025-01-15 |      7497.00 | Delivered |
-- |        2 |           1 | 2025-03-12 |      9998.00 | Delivered |
-- |        3 |           1 | 2025-07-20 |     14997.00 | Delivered |
-- |        4 |           2 | 2025-02-10 |      5499.00 | Delivered |
-- |        5 |           2 | 2025-08-05 |      7998.00 | Shipped   |
-- |        6 |           3 | 2025-05-18 |     10497.00 | Delivered |
-- |        7 |           3 | 2026-01-12 |      2499.00 | Delivered |
-- |        8 |           4 | 2025-06-25 |      8998.00 | Delivered |
-- |        9 |           5 | 2025-09-10 |     14997.00 | Delivered |
-- |       10 |           5 | 2026-02-18 |     19996.00 | Delivered |
-- |       11 |           6 | 2025-11-20 |      9999.00 | Delivered |
-- |       12 |           6 | 2026-03-15 |     12495.00 | Shipped   |
-- |       13 |           7 | 2026-04-10 |      5998.00 | Delivered |
-- |       14 |           7 | 2026-07-22 |     24999.00 | Pending   |
-- |       15 |           8 | 2026-05-05 |     11997.00 | Delivered |
-- |       16 |           8 | 2026-08-18 |      2499.00 | Pending   |
-- |       17 |           9 | 2026-06-14 |      3999.00 | Delivered |
-- |       18 |          10 | 2026-07-30 |      4999.00 | Delivered |
-- |       19 |          11 | 2026-08-05 |      1899.00 | Delivered |
-- |       20 |          12 | 2026-08-25 |      6998.00 | Pending   |
-- +----------+-------------+------------+--------------+-----------+

SELECT * FROM order_items;
-- +---------------+----------+------------+----------+----------+
-- | order_item_id | order_id | product_id | quantity | subtotal |
-- +---------------+----------+------------+----------+----------+
-- |             1 |        1 |          1 |        3 |  7497.00 |
-- |             2 |        2 |          2 |        2 |  9998.00 |
-- |             3 |        3 |          2 |        3 | 14997.00 |
-- |             4 |        4 |          9 |        1 |  5499.00 |
-- |             5 |        5 |          3 |        4 |  7996.00 |
-- |             6 |        6 |          7 |        3 |  8997.00 |
-- |             7 |        6 |          8 |        1 |   999.00 |
-- |             8 |        6 |         14 |        1 |   599.00 |
-- |             9 |        7 |          1 |        1 |  2499.00 |
-- |            10 |        8 |         10 |        2 |  7998.00 |
-- |            11 |        9 |          2 |        3 | 14997.00 |
-- |            12 |       10 |         15 |        1 | 24999.00 |
-- |            13 |       11 |          4 |        2 |  6998.00 |
-- |            14 |       11 |         11 |        1 |  1299.00 |
-- |            15 |       11 |         12 |        1 |   999.00 |
-- |            16 |       12 |          9 |        1 |  5499.00 |
-- |            17 |       12 |          6 |        1 |  2499.00 |
-- |            18 |       12 |          8 |        1 |   999.00 |
-- |            19 |       12 |         13 |        1 |  1899.00 |
-- |            20 |       13 |          7 |        2 |  5998.00 |
-- |            21 |       14 |         15 |        1 | 24999.00 |
-- |            22 |       15 |          2 |        2 |  9998.00 |
-- |            23 |       15 |          1 |        1 |  1999.00 |
-- |            24 |       16 |          1 |        1 |  2499.00 |
-- |            25 |       17 |         10 |        1 |  3999.00 |
-- |            26 |       18 |          2 |        1 |  4999.00 |
-- |            27 |       19 |         13 |        1 |  1899.00 |
-- |            28 |       20 |          3 |        2 |  3998.00 |
-- |            29 |       20 |         14 |        5 |  2995.00 |
-- +---------------+----------+------------+----------+----------+

SELECT * FROM payments;
-- +------------+----------+--------------+----------------+----------------+
-- | payment_id | order_id | payment_date | payment_method | payment_status |
-- +------------+----------+--------------+----------------+----------------+
-- |          1 |        1 | 2025-01-15   | UPI            | Paid           |
-- |          2 |        2 | 2025-03-12   | Credit Card    | Paid           |
-- |          3 |        3 | 2025-07-20   | UPI            | Paid           |
-- |          4 |        4 | 2025-02-10   | PayPal         | Paid           |
-- |          5 |        5 | 2025-08-05   | UPI            | Paid           |
-- |          6 |        6 | 2025-05-18   | Credit Card    | Paid           |
-- |          7 |        7 | 2026-01-12   | UPI            | Paid           |
-- |          8 |        8 | 2025-06-25   | Credit Card    | Paid           |
-- |          9 |        9 | 2025-09-10   | UPI            | Paid           |
-- |         10 |       10 | 2026-02-18   | Credit Card    | Paid           |
-- |         11 |       11 | 2025-11-20   | PayPal         | Paid           |
-- |         12 |       12 | 2026-03-15   | UPI            | Paid           |
-- |         13 |       13 | 2026-04-10   | UPI            | Paid           |
-- |         14 |       14 | 2026-07-22   | Credit Card    | Pending        |
-- |         15 |       15 | 2026-05-05   | UPI            | Paid           |
-- |         16 |       16 | 2026-08-18   | UPI            | Pending        |
-- |         17 |       17 | 2026-06-14   | PayPal         | Paid           |
-- |         18 |       18 | 2026-07-30   | Credit Card    | Paid           |
-- |         19 |       19 | 2026-08-05   | UPI            | Paid           |
-- |         20 |       20 | 2026-08-25   | UPI            | Pending        |
-- +------------+----------+--------------+----------------+----------------+

SELECT * FROM shipping;
-- +-------------+----------+---------------+---------------+-----------------+
-- | shipping_id | order_id | shipping_date | delivery_date | shipping_status |
-- +-------------+----------+---------------+---------------+-----------------+
-- |           1 |        1 | 2025-01-16    | 2025-01-20    | Delivered       |
-- |           2 |        2 | 2025-03-13    | 2025-03-18    | Delivered       |
-- |           3 |        3 | 2025-07-21    | 2025-07-25    | Delivered       |
-- |           4 |        4 | 2025-02-11    | 2025-02-15    | Delivered       |
-- |           5 |        5 | 2025-08-06    | NULL          | In Transit      |
-- |           6 |        6 | 2025-05-19    | 2025-05-24    | Delivered       |
-- |           7 |        7 | 2026-01-13    | 2026-01-17    | Delivered       |
-- |           8 |        8 | 2025-06-26    | 2025-06-30    | Delivered       |
-- |           9 |        9 | 2025-09-11    | 2025-09-16    | Delivered       |
-- |          10 |       10 | 2026-02-19    | 2026-02-24    | Delivered       |
-- |          11 |       11 | 2025-11-21    | 2025-11-26    | Delivered       |
-- |          12 |       12 | 2026-03-16    | NULL          | In Transit      |
-- |          13 |       13 | 2026-04-11    | 2026-04-15    | Delivered       |
-- |          14 |       14 | NULL          | NULL          | In Transit      |
-- |          15 |       15 | 2026-05-06    | 2026-05-10    | Delivered       |
-- |          16 |       16 | NULL          | NULL          | In Transit      |
-- |          17 |       17 | 2026-06-15    | 2026-06-19    | Delivered       |
-- |          18 |       18 | 2026-07-31    | 2026-08-04    | Delivered       |
-- |          19 |       19 | 2026-08-06    | 2026-08-10    | Delivered       |
-- |          20 |       20 | NULL          | NULL          | In Transit      |
-- +-------------+----------+---------------+---------------+-----------------+


-- ============================================================
-- 4. CRUD OPERATIONS
-- ============================================================

-- ------------------------------------------------------------
-- CREATE: Insert a new product
-- ------------------------------------------------------------
INSERT INTO products (name, category_id, price, stock_quantity, added_date)
VALUE ('USB-C Fast Charger', 1, 1499.00, 100, CURDATE());
-- Query OK, 1 row affected (0.366 sec)


-- CREATE: Insert a new customer
INSERT INTO customers
    (name, email, phone_number, address, registration_date)
VALUE
    ('Rahul Mehta', 'rahul@example.com', '9876500099',
     'Ahmedabad, Gujarat', CURDATE());
-- Query OK, 1 row affected (0.307 sec)


-- CREATE: Insert a new order
-- customer_id = 12 is used here because it already exists.
INSERT INTO orders
    (customer_id, order_date, total_amount, status)
VALUES
    (12, CURDATE(), 2998.00, 'Pending');
-- Query OK, 1 row affected (0.323 sec)



-- ------------------------------------------------------------
-- UPDATE: Update product stock
-- Example: 2 units sold from product_id = 1.
-- ------------------------------------------------------------
UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE product_id = 1
  AND stock_quantity >= 2;
-- Query OK, 1 row affected (0.535 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0

-- ------------------------------------------------------------
-- UPDATE: Change order status
-- ------------------------------------------------------------
UPDATE orders
SET status = 'Shipped'
WHERE order_id = 16;
-- Query OK, 1 row affected (0.324 sec)
-- Rows matched: 1  Changed: 1  Warnings: 0


-- ------------------------------------------------------------
-- DELETE: Delete orders that were cancelled more than 30 days ago.
-- ON DELETE CASCADE automatically removes their items, payment,
-- and shipping records.
-- ------------------------------------------------------------
DELETE FROM orders
WHERE status = 'Cancelled'
  AND order_date < DATE_SUB(CURDATE(), INTERVAL 30 DAY);
-- Query OK, 0 rows affected (0.362 sec)



-- ============================================================
-- 5. WHERE, HAVING, LIMIT
-- ============================================================

-- ------------------------------------------------------------
-- Find all orders placed in the last 6 months.
-- ------------------------------------------------------------
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount,
    status
FROM orders
WHERE order_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
ORDER BY order_date DESC;
-- +----------+-------------+------------+--------------+-----------+
-- | order_id | customer_id | order_date | total_amount | status    |
-- +----------+-------------+------------+--------------+-----------+
-- |       21 |          12 | 2026-09-14 |      2998.00 | Pending   |
-- |       20 |          12 | 2026-08-25 |      6998.00 | Pending   |
-- |       16 |           8 | 2026-08-18 |      2499.00 | Shipped   |
-- |       19 |          11 | 2026-08-05 |      1899.00 | Delivered |
-- |       18 |          10 | 2026-07-30 |      4999.00 | Delivered |
-- |       14 |           7 | 2026-07-22 |     24999.00 | Pending   |
-- |       17 |           9 | 2026-06-14 |      3999.00 | Delivered |
-- |       15 |           8 | 2026-05-05 |     11997.00 | Delivered |
-- |       13 |           7 | 2026-04-10 |      5998.00 | Delivered |
-- |       12 |           6 | 2026-03-15 |     12495.00 | Shipped   |
-- +----------+-------------+------------+--------------+-----------+


-- ------------------------------------------------------------
-- Get the top 5 highest-priced products.
-- ------------------------------------------------------------
SELECT
    product_id,
    name,
    price
FROM products
ORDER BY price DESC
LIMIT 5;
-- +------------+------------------------+----------+
-- | product_id | name                   | price    |
-- +------------+------------------------+----------+
-- |         15 | Digital Camera         | 24999.00 |
-- |          9 | Coffee Maker           |  5499.00 |
-- |          2 | Smart Watch            |  4999.00 |
-- |         10 | Non Stick Cookware Set |  3999.00 |
-- |          4 | Mechanical Keyboard    |  3499.00 |
-- +------------+------------------------+----------+


-- ------------------------------------------------------------
-- Find customers who have placed more than 3 orders.
-- ------------------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING COUNT(o.order_id) > 3
ORDER BY total_orders DESC;
-- Empty set (0.468 sec)


-- ============================================================
-- 6. SQL OPERATORS: AND, OR, NOT
-- ============================================================

-- ------------------------------------------------------------
-- Orders where status = Pending AND payment_status = Paid.
-- ------------------------------------------------------------
SELECT
    o.order_id,
    o.order_date,
    o.status,
    p.payment_status
FROM orders o
JOIN payments p
    ON o.order_id = p.order_id
WHERE o.status = 'Pending'
  AND p.payment_status = 'Paid';
-- Empty set (0.271 sec)


-- ------------------------------------------------------------
-- Products that are NOT out of stock.
-- ------------------------------------------------------------
SELECT
    product_id,
    name,
    stock_quantity
FROM products
WHERE NOT stock_quantity = 0;
-- +------------+---------------------------+----------------+
-- | product_id | name                      | stock_quantity |
-- +------------+---------------------------+----------------+
-- |          1 | Wireless Headphones       |            848 |
-- |          2 | Smart Watch               |            650 |
-- |          3 | Bluetooth Speaker         |            500 |
-- |          4 | Mechanical Keyboard       |            250 |
-- |          5 | Cotton T-Shirt            |            300 |
-- |          6 | Denim Jacket              |            180 |
-- |          7 | Running Shoes             |            450 |
-- |          8 | Yoga Mat                  |            600 |
-- |          9 | Coffee Maker              |            120 |
-- |         10 | Non Stick Cookware Set    |            150 |
-- |         11 | The Data Science Handbook |            220 |
-- |         12 | Python Programming Guide  |            200 |
-- |         13 | Travel Backpack           |            275 |
-- |         14 | Smartphone Stand          |            700 |
-- |         15 | Digital Camera            |             50 |
-- |         16 | USB-C Fast Charger        |            100 |
-- +------------+---------------------------+----------------+


-- ------------------------------------------------------------
-- Customers registered after 2022 OR whose purchases exceed
-- 10,000.
-- ------------------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    c.registration_date,
    COALESCE(SUM(o.total_amount), 0) AS total_purchases
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name, c.registration_date
HAVING c.registration_date > '2022-12-31'
    OR COALESCE(SUM(o.total_amount), 0) > 10000
ORDER BY total_purchases DESC;
-- +-------------+-----------------+-------------------+-----------------+
-- | customer_id | name            | registration_date | total_purchases |
-- +-------------+-----------------+-------------------+-----------------+
-- |           5 | Vivaan Desai    | 2023-07-18        |        34993.00 |
-- |           1 |   Aarav Patel   | 2021-06-15        |        32492.00 |
-- |           7 | Arjun Trivedi   | 2024-08-25        |        30997.00 |
-- |           6 | Ishita Patel    | 2024-02-12        |        22494.00 |
-- |           8 | Meera Shah      | 2025-01-14        |        14496.00 |
-- |           2 |   Diya Shah     | 2022-03-20        |        13497.00 |
-- |           3 | Rohan Mehta     | 2022-11-10        |        12996.00 |
-- |          12 | Sara Khan       | 2026-04-03        |         9996.00 |
-- |           4 |   Kavya Joshi   | 2023-01-05        |         8998.00 |
-- |          10 | Anaya Patel     | 2026-01-09        |         4999.00 |
-- |           9 | Kabir Modi      | 2025-05-22        |         3999.00 |
-- |          11 | Neel Verma      | 2026-02-15        |         1899.00 |
-- |          13 | Rahul Mehta     | 2026-09-14        |            0.00 |
-- +-------------+-----------------+-------------------+-----------------+




-- ============================================================
-- 7. SORTING & GROUPING: ORDER BY, GROUP BY
-- ============================================================

-- ------------------------------------------------------------
-- List products sorted by price in descending order.
-- ------------------------------------------------------------
SELECT
    product_id,
    name,
    price
FROM products
ORDER BY price DESC;
-- +------------+---------------------------+----------+
-- | product_id | name                      | price    |
-- +------------+---------------------------+----------+
-- |         15 | Digital Camera            | 24999.00 |
-- |          9 | Coffee Maker              |  5499.00 |
-- |          2 | Smart Watch               |  4999.00 |
-- |         10 | Non Stick Cookware Set    |  3999.00 |
-- |          4 | Mechanical Keyboard       |  3499.00 |
-- |          7 | Running Shoes             |  2999.00 |
-- |          1 | Wireless Headphones       |  2499.00 |
-- |          6 | Denim Jacket              |  2499.00 |
-- |          3 | Bluetooth Speaker         |  1999.00 |
-- |         13 | Travel Backpack           |  1899.00 |
-- |         16 | USB-C Fast Charger        |  1499.00 |
-- |         11 | The Data Science Handbook |  1299.00 |
-- |          8 | Yoga Mat                  |   999.00 |
-- |         12 | Python Programming Guide  |   999.00 |
-- |          5 | Cotton T-Shirt            |   799.00 |
-- |         14 | Smartphone Stand          |   599.00 |
-- +------------+---------------------------+----------+


-- ------------------------------------------------------------
-- Display the number of orders placed by each customer.
-- ------------------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    COUNT(o.order_id) AS order_count
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY order_count DESC, c.customer_id;
-- +-------------+-----------------+-------------+
-- | customer_id | name            | order_count |
-- +-------------+-----------------+-------------+
-- |           1 |   Aarav Patel   |           3 |
-- |           2 |   Diya Shah     |           2 |
-- |           3 | Rohan Mehta     |           2 |
-- |           5 | Vivaan Desai    |           2 |
-- |           6 | Ishita Patel    |           2 |
-- |           7 | Arjun Trivedi   |           2 |
-- |           8 | Meera Shah      |           2 |
-- |          12 | Sara Khan       |           2 |
-- |           4 |   Kavya Joshi   |           1 |
-- |           9 | Kabir Modi      |           1 |
-- |          10 | Anaya Patel     |           1 |
-- |          11 | Neel Verma      |           1 |
-- |          13 | Rahul Mehta     |           0 |
-- +-------------+-----------------+-------------+


-- ------------------------------------------------------------
-- Show total revenue generated by each category.
-- Cancelled orders are excluded.
-- ------------------------------------------------------------
SELECT
    cat.category_id,
    cat.category_name,
    COALESCE(SUM(oi.subtotal), 0) AS category_revenue
FROM categories cat
LEFT JOIN products p
    ON cat.category_id = p.category_id
LEFT JOIN order_items oi
    ON p.product_id = oi.product_id
LEFT JOIN orders o
    ON oi.order_id = o.order_id
   AND o.status <> 'Cancelled'
GROUP BY cat.category_id, cat.category_name
ORDER BY category_revenue DESC;
-- +-------------+----------------+------------------+
-- | category_id | category_name  | category_revenue |
-- +-------------+----------------+------------------+
-- |           1 | Electronics    |        142067.00 |
-- |           3 | Home & Kitchen |         22995.00 |
-- |           5 | Sports         |         16993.00 |
-- |           2 | Clothing       |          6297.00 |
-- |           4 | Books          |          2298.00 |
-- +-------------+----------------+------------------+




-- ============================================================
-- 8. AGGREGATE FUNCTIONS: SUM, AVG, MAX, MIN, COUNT
-- ============================================================

-- ------------------------------------------------------------
-- Find total revenue generated by the store.
-- ------------------------------------------------------------
SELECT
    SUM(total_amount) AS total_revenue
FROM orders
WHERE status <> 'Cancelled';
-- +---------------+
-- | total_revenue |
-- +---------------+
-- |     191856.00 |
-- +---------------+


-- ------------------------------------------------------------
-- Identify the most purchased product.
-- ------------------------------------------------------------
SELECT
    p.product_id,
    p.name,
    SUM(oi.quantity) AS units_sold
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status <> 'Cancelled'
GROUP BY p.product_id, p.name
ORDER BY units_sold DESC
LIMIT 1;
-- +------------+-------------+------------+
-- | product_id | name        | units_sold |
-- +------------+-------------+------------+
-- |          2 | Smart Watch |         11 |
-- +------------+-------------+------------+


-- ------------------------------------------------------------
-- Calculate the average order value.
-- ------------------------------------------------------------
SELECT
    AVG(total_amount) AS average_order_value
FROM orders
WHERE status <> 'Cancelled';
-- +---------------------+
-- | average_order_value |
-- +---------------------+
-- |         9136.000000 |
-- +---------------------+


-- ------------------------------------------------------------
-- Additional aggregate practice.
-- ------------------------------------------------------------
SELECT
    MAX(price) AS highest_product_price,
    MIN(price) AS lowest_product_price,
    AVG(price) AS average_product_price,
    COUNT(product_id) AS total_products
FROM products;
-- +-----------------------+----------------------+-----------------------+----------------+
-- | highest_product_price | lowest_product_price | average_product_price | total_products |
-- +-----------------------+----------------------+-----------------------+----------------+
-- |              24999.00 |               599.00 |           3817.750000 |             16 |
-- +-----------------------+----------------------+-----------------------+----------------+




-- ============================================================
-- 9. PRIMARY KEY & FOREIGN KEY RELATIONSHIPS
-- ============================================================

-- ------------------------------------------------------------
-- Orders linked to customers.
-- ------------------------------------------------------------
SELECT
    o.order_id,
    c.customer_id,
    c.name AS customer_name,
    o.order_date,
    o.total_amount,
    o.status
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id;
-- +----------+-------------+-----------------+------------+--------------+-----------+
-- | order_id | customer_id | customer_name   | order_date | total_amount | status    |
-- +----------+-------------+-----------------+------------+--------------+-----------+
-- |        1 |           1 |   Aarav Patel   | 2025-01-15 |      7497.00 | Delivered |
-- |        2 |           1 |   Aarav Patel   | 2025-03-12 |      9998.00 | Delivered |
-- |        3 |           1 |   Aarav Patel   | 2025-07-20 |     14997.00 | Delivered |
-- |        4 |           2 |   Diya Shah     | 2025-02-10 |      5499.00 | Delivered |
-- |        5 |           2 |   Diya Shah     | 2025-08-05 |      7998.00 | Shipped   |
-- |        6 |           3 | Rohan Mehta     | 2025-05-18 |     10497.00 | Delivered |
-- |        7 |           3 | Rohan Mehta     | 2026-01-12 |      2499.00 | Delivered |
-- |        8 |           4 |   Kavya Joshi   | 2025-06-25 |      8998.00 | Delivered |
-- |        9 |           5 | Vivaan Desai    | 2025-09-10 |     14997.00 | Delivered |
-- |       10 |           5 | Vivaan Desai    | 2026-02-18 |     19996.00 | Delivered |
-- |       11 |           6 | Ishita Patel    | 2025-11-20 |      9999.00 | Delivered |
-- |       12 |           6 | Ishita Patel    | 2026-03-15 |     12495.00 | Shipped   |
-- |       13 |           7 | Arjun Trivedi   | 2026-04-10 |      5998.00 | Delivered |
-- |       14 |           7 | Arjun Trivedi   | 2026-07-22 |     24999.00 | Pending   |
-- |       15 |           8 | Meera Shah      | 2026-05-05 |     11997.00 | Delivered |
-- |       16 |           8 | Meera Shah      | 2026-08-18 |      2499.00 | Shipped   |
-- |       17 |           9 | Kabir Modi      | 2026-06-14 |      3999.00 | Delivered |
-- |       18 |          10 | Anaya Patel     | 2026-07-30 |      4999.00 | Delivered |
-- |       19 |          11 | Neel Verma      | 2026-08-05 |      1899.00 | Delivered |
-- |       20 |          12 | Sara Khan       | 2026-08-25 |      6998.00 | Pending   |
-- |       21 |          12 | Sara Khan       | 2026-09-14 |      2998.00 | Pending   |
-- +----------+-------------+-----------------+------------+--------------+-----------+


-- ------------------------------------------------------------
-- Orders linked to products through Order_Items.
-- ------------------------------------------------------------
SELECT
    o.order_id,
    p.product_id,
    p.name AS product_name,
    oi.quantity,
    oi.subtotal
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
JOIN products p
    ON oi.product_id = p.product_id;
-- +----------+------------+---------------------------+----------+----------+
-- | order_id | product_id | product_name              | quantity | subtotal |
-- +----------+------------+---------------------------+----------+----------+
-- |        1 |          1 | Wireless Headphones       |        3 |  7497.00 |
-- |        2 |          2 | Smart Watch               |        2 |  9998.00 |
-- |        3 |          2 | Smart Watch               |        3 | 14997.00 |
-- |        4 |          9 | Coffee Maker              |        1 |  5499.00 |
-- |        5 |          3 | Bluetooth Speaker         |        4 |  7996.00 |
-- |        6 |          7 | Running Shoes             |        3 |  8997.00 |
-- |        6 |          8 | Yoga Mat                  |        1 |   999.00 |
-- |        6 |         14 | Smartphone Stand          |        1 |   599.00 |
-- |        7 |          1 | Wireless Headphones       |        1 |  2499.00 |
-- |        8 |         10 | Non Stick Cookware Set    |        2 |  7998.00 |
-- |        9 |          2 | Smart Watch               |        3 | 14997.00 |
-- |       10 |         15 | Digital Camera            |        1 | 24999.00 |
-- |       11 |          4 | Mechanical Keyboard       |        2 |  6998.00 |
-- |       11 |         11 | The Data Science Handbook |        1 |  1299.00 |
-- |       11 |         12 | Python Programming Guide  |        1 |   999.00 |
-- |       12 |          9 | Coffee Maker              |        1 |  5499.00 |
-- |       12 |          6 | Denim Jacket              |        1 |  2499.00 |
-- |       12 |          8 | Yoga Mat                  |        1 |   999.00 |
-- |       12 |         13 | Travel Backpack           |        1 |  1899.00 |
-- |       13 |          7 | Running Shoes             |        2 |  5998.00 |
-- |       14 |         15 | Digital Camera            |        1 | 24999.00 |
-- |       15 |          2 | Smart Watch               |        2 |  9998.00 |
-- |       15 |          1 | Wireless Headphones       |        1 |  1999.00 |
-- |       16 |          1 | Wireless Headphones       |        1 |  2499.00 |
-- |       17 |         10 | Non Stick Cookware Set    |        1 |  3999.00 |
-- |       18 |          2 | Smart Watch               |        1 |  4999.00 |
-- |       19 |         13 | Travel Backpack           |        1 |  1899.00 |
-- |       20 |          3 | Bluetooth Speaker         |        2 |  3998.00 |
-- |       20 |         14 | Smartphone Stand          |        5 |  2995.00 |
-- +----------+------------+---------------------------+----------+----------+


-- ------------------------------------------------------------
-- Payments linked to orders.
-- ------------------------------------------------------------
SELECT
    p.payment_id,
    p.order_id,
    o.customer_id,
    p.payment_date,
    p.payment_method,
    p.payment_status
FROM payments p
JOIN orders o
    ON p.order_id = o.order_id;
-- +------------+----------+-------------+--------------+----------------+----------------+
-- | payment_id | order_id | customer_id | payment_date | payment_method | payment_status |
-- +------------+----------+-------------+--------------+----------------+----------------+
-- |          1 |        1 |           1 | 2025-01-15   | UPI            | Paid           |
-- |          2 |        2 |           1 | 2025-03-12   | Credit Card    | Paid           |
-- |          3 |        3 |           1 | 2025-07-20   | UPI            | Paid           |
-- |          4 |        4 |           2 | 2025-02-10   | PayPal         | Paid           |
-- |          5 |        5 |           2 | 2025-08-05   | UPI            | Paid           |
-- |          6 |        6 |           3 | 2025-05-18   | Credit Card    | Paid           |
-- |          7 |        7 |           3 | 2026-01-12   | UPI            | Paid           |
-- |          8 |        8 |           4 | 2025-06-25   | Credit Card    | Paid           |
-- |          9 |        9 |           5 | 2025-09-10   | UPI            | Paid           |
-- |         10 |       10 |           5 | 2026-02-18   | Credit Card    | Paid           |
-- |         11 |       11 |           6 | 2025-11-20   | PayPal         | Paid           |
-- |         12 |       12 |           6 | 2026-03-15   | UPI            | Paid           |
-- |         13 |       13 |           7 | 2026-04-10   | UPI            | Paid           |
-- |         14 |       14 |           7 | 2026-07-22   | Credit Card    | Pending        |
-- |         15 |       15 |           8 | 2026-05-05   | UPI            | Paid           |
-- |         16 |       16 |           8 | 2026-08-18   | UPI            | Pending        |
-- |         17 |       17 |           9 | 2026-06-14   | PayPal         | Paid           |
-- |         18 |       18 |          10 | 2026-07-30   | Credit Card    | Paid           |
-- |         19 |       19 |          11 | 2026-08-05   | UPI            | Paid           |
-- |         20 |       20 |          12 | 2026-08-25   | UPI            | Pending        |
-- +------------+----------+-------------+--------------+----------------+----------------+




-- ============================================================
-- 10. JOINS
-- ============================================================

-- ------------------------------------------------------------
-- INNER JOIN:
-- Retrieve products along with their category names.
-- ------------------------------------------------------------
SELECT
    p.product_id,
    p.name AS product_name,
    c.category_name,
    p.price,
    p.stock_quantity
FROM products p
INNER JOIN categories c
    ON p.category_id = c.category_id
ORDER BY p.product_id;
-- +------------+---------------------------+----------------+----------+----------------+
-- | product_id | product_name              | category_name  | price    | stock_quantity |
-- +------------+---------------------------+----------------+----------+----------------+
-- |          1 | Wireless Headphones       | Electronics    |  2499.00 |            848 |
-- |          2 | Smart Watch               | Electronics    |  4999.00 |            650 |
-- |          3 | Bluetooth Speaker         | Electronics    |  1999.00 |            500 |
-- |          4 | Mechanical Keyboard       | Electronics    |  3499.00 |            250 |
-- |          5 | Cotton T-Shirt            | Clothing       |   799.00 |            300 |
-- |          6 | Denim Jacket              | Clothing       |  2499.00 |            180 |
-- |          7 | Running Shoes             | Sports         |  2999.00 |            450 |
-- |          8 | Yoga Mat                  | Sports         |   999.00 |            600 |
-- |          9 | Coffee Maker              | Home & Kitchen |  5499.00 |            120 |
-- |         10 | Non Stick Cookware Set    | Home & Kitchen |  3999.00 |            150 |
-- |         11 | The Data Science Handbook | Books          |  1299.00 |            220 |
-- |         12 | Python Programming Guide  | Books          |   999.00 |            200 |
-- |         13 | Travel Backpack           | Clothing       |  1899.00 |            275 |
-- |         14 | Smartphone Stand          | Electronics    |   599.00 |            700 |
-- |         15 | Digital Camera            | Electronics    | 24999.00 |             50 |
-- |         16 | USB-C Fast Charger        | Electronics    |  1499.00 |            100 |
-- +------------+---------------------------+----------------+----------+----------------+


-- ------------------------------------------------------------
-- LEFT JOIN:
-- Get all orders with customer details.
-- ------------------------------------------------------------
SELECT
    o.order_id,
    c.customer_id,
    c.name AS customer_name,
    c.email,
    o.order_date,
    o.total_amount,
    o.status
FROM orders o
LEFT JOIN customers c
    ON o.customer_id = c.customer_id
ORDER BY o.order_id;
-- +----------+-------------+-----------------+--------------------+------------+--------------+-----------+
-- | order_id | customer_id | customer_name   | email              | order_date | total_amount | status    |
-- +----------+-------------+-----------------+--------------------+------------+--------------+-----------+
-- |        1 |           1 |   Aarav Patel   | aarav@example.com  | 2025-01-15 |      7497.00 | Delivered |
-- |        2 |           1 |   Aarav Patel   | aarav@example.com  | 2025-03-12 |      9998.00 | Delivered |
-- |        3 |           1 |   Aarav Patel   | aarav@example.com  | 2025-07-20 |     14997.00 | Delivered |
-- |        4 |           2 |   Diya Shah     | diya@example.com   | 2025-02-10 |      5499.00 | Delivered |
-- |        5 |           2 |   Diya Shah     | diya@example.com   | 2025-08-05 |      7998.00 | Shipped   |
-- |        6 |           3 | Rohan Mehta     | rohan@example.com  | 2025-05-18 |     10497.00 | Delivered |
-- |        7 |           3 | Rohan Mehta     | rohan@example.com  | 2026-01-12 |      2499.00 | Delivered |
-- |        8 |           4 |   Kavya Joshi   | NULL               | 2025-06-25 |      8998.00 | Delivered |
-- |        9 |           5 | Vivaan Desai    | vivaan@example.com | 2025-09-10 |     14997.00 | Delivered |
-- |       10 |           5 | Vivaan Desai    | vivaan@example.com | 2026-02-18 |     19996.00 | Delivered |
-- |       11 |           6 | Ishita Patel    | ishita@example.com | 2025-11-20 |      9999.00 | Delivered |
-- |       12 |           6 | Ishita Patel    | ishita@example.com | 2026-03-15 |     12495.00 | Shipped   |
-- |       13 |           7 | Arjun Trivedi   | arjun@example.com  | 2026-04-10 |      5998.00 | Delivered |
-- |       14 |           7 | Arjun Trivedi   | arjun@example.com  | 2026-07-22 |     24999.00 | Pending   |
-- |       15 |           8 | Meera Shah      | meera@example.com  | 2026-05-05 |     11997.00 | Delivered |
-- |       16 |           8 | Meera Shah      | meera@example.com  | 2026-08-18 |      2499.00 | Shipped   |
-- |       17 |           9 | Kabir Modi      | kabir@example.com  | 2026-06-14 |      3999.00 | Delivered |
-- |       18 |          10 | Anaya Patel     | anaya@example.com  | 2026-07-30 |      4999.00 | Delivered |
-- |       19 |          11 | Neel Verma      | neel@example.com   | 2026-08-05 |      1899.00 | Delivered |
-- |       20 |          12 | Sara Khan       | sara@example.com   | 2026-08-25 |      6998.00 | Pending   |
-- |       21 |          12 | Sara Khan       | sara@example.com   | 2026-09-14 |      2998.00 | Pending   |
-- +----------+-------------+-----------------+--------------------+------------+--------------+-----------+



-- ------------------------------------------------------------
-- RIGHT JOIN:
-- Find orders that haven't been shipped.
-- In this query, all shipping records are preserved.
-- ------------------------------------------------------------
SELECT
    o.order_id,
    o.status AS order_status,
    s.shipping_id,
    s.shipping_status
FROM orders o
RIGHT JOIN shipping s
    ON o.order_id = s.order_id
WHERE s.shipping_id IS NOT NULL
  AND s.shipping_date IS NULL;
-- +----------+--------------+-------------+-----------------+
-- | order_id | order_status | shipping_id | shipping_status |
-- +----------+--------------+-------------+-----------------+
-- |       14 | Pending      |          14 | In Transit      |
-- |       16 | Shipped      |          16 | In Transit      |
-- |       20 | Pending      |          20 | In Transit      |
-- +----------+--------------+-------------+-----------------+


-- ------------------------------------------------------------
-- FULL OUTER JOIN:
-- MySQL does not directly support FULL OUTER JOIN.
-- LEFT JOIN + RIGHT JOIN with UNION gives the same result.
--
-- Show all customers and all orders, including unmatched rows.
-- ------------------------------------------------------------
SELECT
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
UNION
SELECT
    c.customer_id,
    c.name AS customer_name,
    o.order_id,
    o.order_date,
    o.total_amount
FROM customers c
RIGHT JOIN orders o
    ON c.customer_id = o.customer_id
ORDER BY customer_id, order_id;
-- +-------------+-----------------+----------+------------+--------------+
-- | customer_id | customer_name   | order_id | order_date | total_amount |
-- +-------------+-----------------+----------+------------+--------------+
-- |           1 |   Aarav Patel   |        1 | 2025-01-15 |      7497.00 |
-- |           1 |   Aarav Patel   |        2 | 2025-03-12 |      9998.00 |
-- |           1 |   Aarav Patel   |        3 | 2025-07-20 |     14997.00 |
-- |           2 |   Diya Shah     |        4 | 2025-02-10 |      5499.00 |
-- |           2 |   Diya Shah     |        5 | 2025-08-05 |      7998.00 |
-- |           3 | Rohan Mehta     |        6 | 2025-05-18 |     10497.00 |
-- |           3 | Rohan Mehta     |        7 | 2026-01-12 |      2499.00 |
-- |           4 |   Kavya Joshi   |        8 | 2025-06-25 |      8998.00 |
-- |           5 | Vivaan Desai    |        9 | 2025-09-10 |     14997.00 |
-- |           5 | Vivaan Desai    |       10 | 2026-02-18 |     19996.00 |
-- |           6 | Ishita Patel    |       11 | 2025-11-20 |      9999.00 |
-- |           6 | Ishita Patel    |       12 | 2026-03-15 |     12495.00 |
-- |           7 | Arjun Trivedi   |       13 | 2026-04-10 |      5998.00 |
-- |           7 | Arjun Trivedi   |       14 | 2026-07-22 |     24999.00 |
-- |           8 | Meera Shah      |       15 | 2026-05-05 |     11997.00 |
-- |           8 | Meera Shah      |       16 | 2026-08-18 |      2499.00 |
-- |           9 | Kabir Modi      |       17 | 2026-06-14 |      3999.00 |
-- |          10 | Anaya Patel     |       18 | 2026-07-30 |      4999.00 |
-- |          11 | Neel Verma      |       19 | 2026-08-05 |      1899.00 |
-- |          12 | Sara Khan       |       20 | 2026-08-25 |      6998.00 |
-- |          12 | Sara Khan       |       21 | 2026-09-14 |      2998.00 |
-- |          13 | Rahul Mehta     |     NULL | NULL       |         NULL |
-- +-------------+-----------------+----------+------------+--------------+




-- ============================================================
-- 11. SUBQUERIES
-- ============================================================

-- ------------------------------------------------------------
-- Find orders placed by customers who registered after 2022.
-- ------------------------------------------------------------
SELECT
    order_id,
    customer_id,
    order_date,
    total_amount
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM customers
    WHERE registration_date > '2022-12-31'
)
ORDER BY order_date;
-- +----------+-------------+------------+--------------+
-- | order_id | customer_id | order_date | total_amount |
-- +----------+-------------+------------+--------------+
-- |        8 |           4 | 2025-06-25 |      8998.00 |
-- |        9 |           5 | 2025-09-10 |     14997.00 |
-- |       11 |           6 | 2025-11-20 |      9999.00 |
-- |       10 |           5 | 2026-02-18 |     19996.00 |
-- |       12 |           6 | 2026-03-15 |     12495.00 |
-- |       13 |           7 | 2026-04-10 |      5998.00 |
-- |       15 |           8 | 2026-05-05 |     11997.00 |
-- |       17 |           9 | 2026-06-14 |      3999.00 |
-- |       14 |           7 | 2026-07-22 |     24999.00 |
-- |       18 |          10 | 2026-07-30 |      4999.00 |
-- |       19 |          11 | 2026-08-05 |      1899.00 |
-- |       16 |           8 | 2026-08-18 |      2499.00 |
-- |       20 |          12 | 2026-08-25 |      6998.00 |
-- |       21 |          12 | 2026-09-14 |      2998.00 |
-- +----------+-------------+------------+--------------+


-- ------------------------------------------------------------
-- Identify the customer who has spent the most.
-- ------------------------------------------------------------
SELECT
    c.customer_id,
    c.name,
    SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status <> 'Cancelled'
GROUP BY c.customer_id, c.name
HAVING SUM(o.total_amount) = (
    SELECT MAX(customer_total)
    FROM (
        SELECT
            customer_id,
            SUM(total_amount) AS customer_total
        FROM orders
        WHERE status <> 'Cancelled'
        GROUP BY customer_id
    ) AS spending
);
-- +-------------+--------------+-------------+
-- | customer_id | name         | total_spent |
-- +-------------+--------------+-------------+
-- |           5 | Vivaan Desai |    34993.00 |
-- +-------------+--------------+-------------+



-- ------------------------------------------------------------
-- Get products that have never been ordered.
-- ------------------------------------------------------------
SELECT
    p.product_id,
    p.name,
    p.price
FROM products p
WHERE p.product_id NOT IN (
    SELECT DISTINCT oi.product_id
    FROM order_items oi
)
ORDER BY p.product_id;
-- +------------+--------------------+---------+
-- | product_id | name               | price   |
-- +------------+--------------------+---------+
-- |          5 | Cotton T-Shirt     |  799.00 |
-- |         16 | USB-C Fast Charger | 1499.00 |
-- +------------+--------------------+---------+




-- ============================================================
-- 12. DATE & TIME FUNCTIONS
-- ============================================================

-- ------------------------------------------------------------
-- Extract the month from order_date to count orders per month.
-- ------------------------------------------------------------
SELECT
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY MONTH(order_date)
ORDER BY order_month;
-- +-------------+--------------+
-- | order_month | total_orders |
-- +-------------+--------------+
-- |           1 |            2 |
-- |           2 |            2 |
-- |           3 |            2 |
-- |           4 |            1 |
-- |           5 |            2 |
-- |           6 |            2 |
-- |           7 |            3 |
-- |           8 |            4 |
-- |           9 |            2 |
-- |          11 |            1 |
-- +-------------+--------------+


-- ------------------------------------------------------------
-- Count orders month-wise with year included.
-- This is safer when the data contains multiple years.
-- ------------------------------------------------------------
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY order_year, order_month;
-- +------------+-------------+--------------+
-- | order_year | order_month | total_orders |
-- +------------+-------------+--------------+
-- |       2025 |           1 |            1 |
-- |       2025 |           2 |            1 |
-- |       2025 |           3 |            1 |
-- |       2025 |           5 |            1 |
-- |       2025 |           6 |            1 |
-- |       2025 |           7 |            1 |
-- |       2025 |           8 |            1 |
-- |       2025 |           9 |            1 |
-- |       2025 |          11 |            1 |
-- |       2026 |           1 |            1 |
-- |       2026 |           2 |            1 |
-- |       2026 |           3 |            1 |
-- |       2026 |           4 |            1 |
-- |       2026 |           5 |            1 |
-- |       2026 |           6 |            1 |
-- |       2026 |           7 |            2 |
-- |       2026 |           8 |            3 |
-- |       2026 |           9 |            1 |
-- +------------+-------------+--------------+


-- ------------------------------------------------------------
-- Calculate delivery time using shipping_date and delivery_date.
-- ------------------------------------------------------------
SELECT
    shipping_id,
    order_id,
    shipping_date,
    delivery_date,
    DATEDIFF(delivery_date, shipping_date) AS delivery_days
FROM shipping
WHERE shipping_date IS NOT NULL
  AND delivery_date IS NOT NULL
ORDER BY delivery_days DESC;
-- +-------------+----------+---------------+---------------+---------------+
-- | shipping_id | order_id | shipping_date | delivery_date | delivery_days |
-- +-------------+----------+---------------+---------------+---------------+
-- |           2 |        2 | 2025-03-13    | 2025-03-18    |             5 |
-- |           6 |        6 | 2025-05-19    | 2025-05-24    |             5 |
-- |           9 |        9 | 2025-09-11    | 2025-09-16    |             5 |
-- |          10 |       10 | 2026-02-19    | 2026-02-24    |             5 |
-- |          11 |       11 | 2025-11-21    | 2025-11-26    |             5 |
-- |           1 |        1 | 2025-01-16    | 2025-01-20    |             4 |
-- |           3 |        3 | 2025-07-21    | 2025-07-25    |             4 |
-- |           4 |        4 | 2025-02-11    | 2025-02-15    |             4 |
-- |           7 |        7 | 2026-01-13    | 2026-01-17    |             4 |
-- |           8 |        8 | 2025-06-26    | 2025-06-30    |             4 |
-- |          13 |       13 | 2026-04-11    | 2026-04-15    |             4 |
-- |          15 |       15 | 2026-05-06    | 2026-05-10    |             4 |
-- |          17 |       17 | 2026-06-15    | 2026-06-19    |             4 |
-- |          18 |       18 | 2026-07-31    | 2026-08-04    |             4 |
-- |          19 |       19 | 2026-08-06    | 2026-08-10    |             4 |
-- +-------------+----------+---------------+---------------+---------------+


-- ------------------------------------------------------------
-- Format order_date as DD-MM-YYYY.
-- ------------------------------------------------------------
SELECT
    order_id,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_order_date,
    total_amount,
    status
FROM orders
ORDER BY order_id;
-- +----------+----------------------+--------------+-----------+
-- | order_id | formatted_order_date | total_amount | status    |
-- +----------+----------------------+--------------+-----------+
-- |        1 | 15-01-2025           |      7497.00 | Delivered |
-- |        2 | 12-03-2025           |      9998.00 | Delivered |
-- |        3 | 20-07-2025           |     14997.00 | Delivered |
-- |        4 | 10-02-2025           |      5499.00 | Delivered |
-- |        5 | 05-08-2025           |      7998.00 | Shipped   |
-- |        6 | 18-05-2025           |     10497.00 | Delivered |
-- |        7 | 12-01-2026           |      2499.00 | Delivered |
-- |        8 | 25-06-2025           |      8998.00 | Delivered |
-- |        9 | 10-09-2025           |     14997.00 | Delivered |
-- |       10 | 18-02-2026           |     19996.00 | Delivered |
-- |       11 | 20-11-2025           |      9999.00 | Delivered |
-- |       12 | 15-03-2026           |     12495.00 | Shipped   |
-- |       13 | 10-04-2026           |      5998.00 | Delivered |
-- |       14 | 22-07-2026           |     24999.00 | Pending   |
-- |       15 | 05-05-2026           |     11997.00 | Delivered |
-- |       16 | 18-08-2026           |      2499.00 | Shipped   |
-- |       17 | 14-06-2026           |      3999.00 | Delivered |
-- |       18 | 30-07-2026           |      4999.00 | Delivered |
-- |       19 | 05-08-2026           |      1899.00 | Delivered |
-- |       20 | 25-08-2026           |      6998.00 | Pending   |
-- |       21 | 14-09-2026           |      2998.00 | Pending   |
-- +----------+----------------------+--------------+-----------+




-- ============================================================
-- 13. STRING MANIPULATION FUNCTIONS
-- ============================================================

-- ------------------------------------------------------------
-- Convert all product names to uppercase.
-- ------------------------------------------------------------
SELECT
    product_id,
    UPPER(name) AS uppercase_product_name
FROM products;
-- +------------+---------------------------+
-- | product_id | uppercase_product_name    |
-- +------------+---------------------------+
-- |          1 | WIRELESS HEADPHONES       |
-- |          2 | SMART WATCH               |
-- |          3 | BLUETOOTH SPEAKER         |
-- |          4 | MECHANICAL KEYBOARD       |
-- |          5 | COTTON T-SHIRT            |
-- |          6 | DENIM JACKET              |
-- |          7 | RUNNING SHOES             |
-- |          8 | YOGA MAT                  |
-- |          9 | COFFEE MAKER              |
-- |         10 | NON STICK COOKWARE SET    |
-- |         11 | THE DATA SCIENCE HANDBOOK |
-- |         12 | PYTHON PROGRAMMING GUIDE  |
-- |         13 | TRAVEL BACKPACK           |
-- |         14 | SMARTPHONE STAND          |
-- |         15 | DIGITAL CAMERA            |
-- |         16 | USB-C FAST CHARGER        |
-- +------------+---------------------------+


-- ------------------------------------------------------------
-- Trim whitespace from customer names.
-- ------------------------------------------------------------
SELECT
    customer_id,
    CONCAT('[', name, ']') AS original_name,
    CONCAT('[', TRIM(name), ']') AS trimmed_name
FROM customers;
-- +-------------+-------------------+-----------------+
-- | customer_id | original_name     | trimmed_name    |
-- +-------------+-------------------+-----------------+
-- |           1 | [  Aarav Patel  ] | [Aarav Patel]   |
-- |           2 | [  Diya Shah ]    | [Diya Shah]     |
-- |           3 | [Rohan Mehta]     | [Rohan Mehta]   |
-- |           4 | [  Kavya Joshi  ] | [Kavya Joshi]   |
-- |           5 | [Vivaan Desai]    | [Vivaan Desai]  |
-- |           6 | [Ishita Patel]    | [Ishita Patel]  |
-- |           7 | [Arjun Trivedi]   | [Arjun Trivedi] |
-- |           8 | [Meera Shah]      | [Meera Shah]    |
-- |           9 | [Kabir Modi]      | [Kabir Modi]    |
-- |          10 | [Anaya Patel]     | [Anaya Patel]   |
-- |          11 | [Neel Verma]      | [Neel Verma]    |
-- |          12 | [Sara Khan]       | [Sara Khan]     |
-- |          13 | [Rahul Mehta]     | [Rahul Mehta]   |
-- +-------------+-------------------+-----------------+


-- ------------------------------------------------------------
-- Replace missing email values with "Not Provided".
-- ------------------------------------------------------------
SELECT
    customer_id,
    TRIM(name) AS customer_name,
    COALESCE(email, 'Not Provided') AS email
FROM customers
ORDER BY customer_id;
-- +-------------+---------------+--------------------+
-- | customer_id | customer_name | email              |
-- +-------------+---------------+--------------------+
-- |           1 | Aarav Patel   | aarav@example.com  |
-- |           2 | Diya Shah     | diya@example.com   |
-- |           3 | Rohan Mehta   | rohan@example.com  |
-- |           4 | Kavya Joshi   | Not Provided       |
-- |           5 | Vivaan Desai  | vivaan@example.com |
-- |           6 | Ishita Patel  | ishita@example.com |
-- |           7 | Arjun Trivedi | arjun@example.com  |
-- |           8 | Meera Shah    | meera@example.com  |
-- |           9 | Kabir Modi    | kabir@example.com  |
-- |          10 | Anaya Patel   | anaya@example.com  |
-- |          11 | Neel Verma    | neel@example.com   |
-- |          12 | Sara Khan     | sara@example.com   |
-- |          13 | Rahul Mehta   | rahul@example.com  |
-- +-------------+---------------+--------------------+





-- ============================================================
-- 14. WINDOW FUNCTIONS
-- ============================================================

-- ------------------------------------------------------------
-- Rank customers based on total spending.
-- ------------------------------------------------------------
WITH customer_spending AS (
    SELECT
        c.customer_id,
        TRIM(c.name) AS customer_name,
        COALESCE(SUM(
            CASE
                WHEN o.status <> 'Cancelled' THEN o.total_amount
                ELSE 0
            END
        ), 0) AS total_spending
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, TRIM(c.name)
)
SELECT
    customer_id,
    customer_name,
    total_spending,
    RANK() OVER (ORDER BY total_spending DESC) AS spending_rank
FROM customer_spending
ORDER BY spending_rank, customer_id;
-- +-------------+---------------+----------------+---------------+
-- | customer_id | customer_name | total_spending | spending_rank |
-- +-------------+---------------+----------------+---------------+
-- |           5 | Vivaan Desai  |       34993.00 |             1 |
-- |           1 | Aarav Patel   |       32492.00 |             2 |
-- |           7 | Arjun Trivedi |       30997.00 |             3 |
-- |           6 | Ishita Patel  |       22494.00 |             4 |
-- |           8 | Meera Shah    |       14496.00 |             5 |
-- |           2 | Diya Shah     |       13497.00 |             6 |
-- |           3 | Rohan Mehta   |       12996.00 |             7 |
-- |          12 | Sara Khan     |        9996.00 |             8 |
-- |           4 | Kavya Joshi   |        8998.00 |             9 |
-- |          10 | Anaya Patel   |        4999.00 |            10 |
-- |           9 | Kabir Modi    |        3999.00 |            11 |
-- |          11 | Neel Verma    |        1899.00 |            12 |
-- |          13 | Rahul Mehta   |           0.00 |            13 |
-- +-------------+---------------+----------------+---------------+


-- ------------------------------------------------------------
-- Show cumulative total revenue per month.
-- ------------------------------------------------------------
WITH monthly_revenue AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS order_month,
        SUM(
            CASE
                WHEN status <> 'Cancelled' THEN total_amount
                ELSE 0
            END
        ) AS monthly_revenue
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    order_month,
    monthly_revenue,
    SUM(monthly_revenue) OVER (
        ORDER BY order_month
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM monthly_revenue
ORDER BY order_month;
-- +-------------+-----------------+--------------------+
-- | order_month | monthly_revenue | cumulative_revenue |
-- +-------------+-----------------+--------------------+
-- | 2025-01     |         7497.00 |            7497.00 |
-- | 2025-02     |         5499.00 |           12996.00 |
-- | 2025-03     |         9998.00 |           22994.00 |
-- | 2025-05     |        10497.00 |           33491.00 |
-- | 2025-06     |         8998.00 |           42489.00 |
-- | 2025-07     |        14997.00 |           57486.00 |
-- | 2025-08     |         7998.00 |           65484.00 |
-- | 2025-09     |        14997.00 |           80481.00 |
-- | 2025-11     |         9999.00 |           90480.00 |
-- | 2026-01     |         2499.00 |           92979.00 |
-- | 2026-02     |        19996.00 |          112975.00 |
-- | 2026-03     |        12495.00 |          125470.00 |
-- | 2026-04     |         5998.00 |          131468.00 |
-- | 2026-05     |        11997.00 |          143465.00 |
-- | 2026-06     |         3999.00 |          147464.00 |
-- | 2026-07     |        29998.00 |          177462.00 |
-- | 2026-08     |        11396.00 |          188858.00 |
-- | 2026-09     |         2998.00 |          191856.00 |
-- +-------------+-----------------+--------------------+


-- ------------------------------------------------------------
-- Display the running total of orders placed.
-- ------------------------------------------------------------
SELECT
    order_id,
    order_date,
    customer_id,
    total_amount,
    COUNT(*) OVER (
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_order_count
FROM orders
ORDER BY order_date, order_id;
-- +----------+------------+-------------+--------------+---------------------+
-- | order_id | order_date | customer_id | total_amount | running_order_count |
-- +----------+------------+-------------+--------------+---------------------+
-- |        1 | 2025-01-15 |           1 |      7497.00 |                   1 |
-- |        4 | 2025-02-10 |           2 |      5499.00 |                   2 |
-- |        2 | 2025-03-12 |           1 |      9998.00 |                   3 |
-- |        6 | 2025-05-18 |           3 |     10497.00 |                   4 |
-- |        8 | 2025-06-25 |           4 |      8998.00 |                   5 |
-- |        3 | 2025-07-20 |           1 |     14997.00 |                   6 |
-- |        5 | 2025-08-05 |           2 |      7998.00 |                   7 |
-- |        9 | 2025-09-10 |           5 |     14997.00 |                   8 |
-- |       11 | 2025-11-20 |           6 |      9999.00 |                   9 |
-- |        7 | 2026-01-12 |           3 |      2499.00 |                  10 |
-- |       10 | 2026-02-18 |           5 |     19996.00 |                  11 |
-- |       12 | 2026-03-15 |           6 |     12495.00 |                  12 |
-- |       13 | 2026-04-10 |           7 |      5998.00 |                  13 |
-- |       15 | 2026-05-05 |           8 |     11997.00 |                  14 |
-- |       17 | 2026-06-14 |           9 |      3999.00 |                  15 |
-- |       14 | 2026-07-22 |           7 |     24999.00 |                  16 |
-- |       18 | 2026-07-30 |          10 |      4999.00 |                  17 |
-- |       19 | 2026-08-05 |          11 |      1899.00 |                  18 |
-- |       16 | 2026-08-18 |           8 |      2499.00 |                  19 |
-- |       20 | 2026-08-25 |          12 |      6998.00 |                  20 |
-- |       21 | 2026-09-14 |          12 |      2998.00 |                  21 |
-- +----------+------------+-------------+--------------+---------------------+


-- ------------------------------------------------------------
-- Extra window-function practice:
-- Running customer spending.
-- ------------------------------------------------------------
SELECT
    customer_id,
    order_id,
    order_date,
    total_amount,
    SUM(total_amount) OVER (
        PARTITION BY customer_id
        ORDER BY order_date, order_id
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS customer_running_spending
FROM orders
WHERE status <> 'Cancelled'
ORDER BY customer_id, order_date, order_id;
-- +-------------+----------+------------+--------------+---------------------------+
-- | customer_id | order_id | order_date | total_amount | customer_running_spending |
-- +-------------+----------+------------+--------------+---------------------------+
-- |           1 |        1 | 2025-01-15 |      7497.00 |                   7497.00 |
-- |           1 |        2 | 2025-03-12 |      9998.00 |                  17495.00 |
-- |           1 |        3 | 2025-07-20 |     14997.00 |                  32492.00 |
-- |           2 |        4 | 2025-02-10 |      5499.00 |                   5499.00 |
-- |           2 |        5 | 2025-08-05 |      7998.00 |                  13497.00 |
-- |           3 |        6 | 2025-05-18 |     10497.00 |                  10497.00 |
-- |           3 |        7 | 2026-01-12 |      2499.00 |                  12996.00 |
-- |           4 |        8 | 2025-06-25 |      8998.00 |                   8998.00 |
-- |           5 |        9 | 2025-09-10 |     14997.00 |                  14997.00 |
-- |           5 |       10 | 2026-02-18 |     19996.00 |                  34993.00 |
-- |           6 |       11 | 2025-11-20 |      9999.00 |                   9999.00 |
-- |           6 |       12 | 2026-03-15 |     12495.00 |                  22494.00 |
-- |           7 |       13 | 2026-04-10 |      5998.00 |                   5998.00 |
-- |           7 |       14 | 2026-07-22 |     24999.00 |                  30997.00 |
-- |           8 |       15 | 2026-05-05 |     11997.00 |                  11997.00 |
-- |           8 |       16 | 2026-08-18 |      2499.00 |                  14496.00 |
-- |           9 |       17 | 2026-06-14 |      3999.00 |                   3999.00 |
-- |          10 |       18 | 2026-07-30 |      4999.00 |                   4999.00 |
-- |          11 |       19 | 2026-08-05 |      1899.00 |                   1899.00 |
-- |          12 |       20 | 2026-08-25 |      6998.00 |                   6998.00 |
-- |          12 |       21 | 2026-09-14 |      2998.00 |                   9996.00 |
-- +-------------+----------+------------+--------------+---------------------------+




-- ============================================================
-- 15. SQL CASE EXPRESSIONS
-- ============================================================

-- ------------------------------------------------------------
-- Assign Loyalty_Status to customers:
-- Gold   = spent above 50,000
-- Silver = spent between 20,000 and 50,000
-- Bronze = otherwise
-- ------------------------------------------------------------
WITH customer_spending AS (
    SELECT
        c.customer_id,
        TRIM(c.name) AS customer_name,
        COALESCE(SUM(
            CASE
                WHEN o.status <> 'Cancelled' THEN o.total_amount
                ELSE 0
            END
        ), 0) AS total_spent
    FROM customers c
    LEFT JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id, TRIM(c.name)
)
SELECT
    customer_id,
    customer_name,
    total_spent,
    CASE
        WHEN total_spent > 50000 THEN 'Gold'
        WHEN total_spent BETWEEN 20000 AND 50000 THEN 'Silver'
        ELSE 'Bronze'
    END AS Loyalty_Status
FROM customer_spending
ORDER BY total_spent DESC;
-- +-------------+---------------+-------------+----------------+
-- | customer_id | customer_name | total_spent | Loyalty_Status |
-- +-------------+---------------+-------------+----------------+
-- |           5 | Vivaan Desai  |    34993.00 | Silver         |
-- |           1 | Aarav Patel   |    32492.00 | Silver         |
-- |           7 | Arjun Trivedi |    30997.00 | Silver         |
-- |           6 | Ishita Patel  |    22494.00 | Silver         |
-- |           8 | Meera Shah    |    14496.00 | Bronze         |
-- |           2 | Diya Shah     |    13497.00 | Bronze         |
-- |           3 | Rohan Mehta   |    12996.00 | Bronze         |
-- |          12 | Sara Khan     |     9996.00 | Bronze         |
-- |           4 | Kavya Joshi   |     8998.00 | Bronze         |
-- |          10 | Anaya Patel   |     4999.00 | Bronze         |
-- |           9 | Kabir Modi    |     3999.00 | Bronze         |
-- |          11 | Neel Verma    |     1899.00 | Bronze         |
-- |          13 | Rahul Mehta   |        0.00 | Bronze         |
-- +-------------+---------------+-------------+----------------+



-- ------------------------------------------------------------
-- Categorize products by units sold:
-- Best Seller = sold more than 500 units
-- Popular     = sold between 200 and 500 units
-- Regular     = otherwise
-- ------------------------------------------------------------
WITH product_sales AS (
    SELECT
        p.product_id,
        p.name AS product_name,
        COALESCE(SUM(
            CASE
                WHEN o.status <> 'Cancelled' THEN oi.quantity
                ELSE 0
            END
        ), 0) AS units_sold
    FROM products p
    LEFT JOIN order_items oi
        ON p.product_id = oi.product_id
    LEFT JOIN orders o
        ON oi.order_id = o.order_id
    GROUP BY p.product_id, p.name
)
SELECT
    product_id,
    product_name,
    units_sold,
    CASE
        WHEN units_sold > 500 THEN 'Best Seller'
        WHEN units_sold BETWEEN 200 AND 500 THEN 'Popular'
        ELSE 'Regular'
    END AS product_category
FROM product_sales
ORDER BY units_sold DESC;
-- +------------+---------------------------+------------+------------------+
-- | product_id | product_name              | units_sold | product_category |
-- +------------+---------------------------+------------+------------------+
-- |          2 | Smart Watch               |         11 | Regular          |
-- |          1 | Wireless Headphones       |          6 | Regular          |
-- |          3 | Bluetooth Speaker         |          6 | Regular          |
-- |         14 | Smartphone Stand          |          6 | Regular          |
-- |          7 | Running Shoes             |          5 | Regular          |
-- |         10 | Non Stick Cookware Set    |          3 | Regular          |
-- |          4 | Mechanical Keyboard       |          2 | Regular          |
-- |          8 | Yoga Mat                  |          2 | Regular          |
-- |          9 | Coffee Maker              |          2 | Regular          |
-- |         13 | Travel Backpack           |          2 | Regular          |
-- |         15 | Digital Camera            |          2 | Regular          |
-- |          6 | Denim Jacket              |          1 | Regular          |
-- |         11 | The Data Science Handbook |          1 | Regular          |
-- |         12 | Python Programming Guide  |          1 | Regular          |
-- |          5 | Cotton T-Shirt            |          0 | Regular          |
-- |         16 | USB-C Fast Charger        |          0 | Regular          |
-- +------------+---------------------------+------------+------------------+