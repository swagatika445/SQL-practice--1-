/* ============================================================
   PRACTICE FILE: AGGREGATE FUNCTIONS & TEXT FUNCTIONS
   Table: Products
   Instructions: Write the SQL query below each question.
   ============================================================ */


/* ------------------------------------------------------------
   STEP 1: CREATE TABLE
   ------------------------------------------------------------ */

Create database practice1;
use practice1;


CREATE TABLE Products (
    product_id INT,
    product_name VARCHAR(50),
    category VARCHAR(50),
    city VARCHAR(50),
    price INT,
    description VARCHAR(100)
);


/* ------------------------------------------------------------
   STEP 2: INSERT DATA
   ------------------------------------------------------------ */

INSERT INTO Products VALUES
(1, 'wireless mouse', 'Electronics', 'Bangalore', 799, 'compact wireless mouse'),
(2, 'Office Chair', 'Furniture', 'Delhi', 4500, 'ergonomic office chair'),
(3, 'BLUETOOTH SPEAKER', 'Electronics', 'Bangalore', 2200, 'portable bluetooth speaker'),
(4, 'Study Table', 'Furniture', 'Mumbai', 3800, 'wooden study table'),
(5, 'laptop stand', 'Electronics', 'Pune', 1200, 'adjustable laptop stand'),
(6, 'Bookshelf', 'Furniture', 'Delhi', 3200, 'wall mounted bookshelf'),
(7, 'Table Lamp', 'Electronics', 'Mumbai', 950, 'LED table lamp'),
(8, '  Yoga Mat  ', 'Fitness', 'Bangalore', 600, 'non-slip yoga mat');

select * from products ;
/* ============================================================
   SECTION A: AGGREGATE FUNCTIONS
   ============================================================ */

-- Q1. Find the total number of products.
select count(product_name) from Products;

-- Q2. Find the total value of all products (sum of prices).
select sum(price) as total_value from products;

-- Q3. Find the average price of products.
select avg(price) as average_price from products;

-- Q4. Find the most expensive and least expensive product price.
select max(price) as most_expensive_price,
min(price) as least_expensive_price
from products;


-- Q5. Find how many products exist in each category.
select category, count(*) as product_count
from products
group by category;


-- Q6. Find the average price per city.
select city,
avg(price) as average_price
from products
group by city;

-- Q7. Find categories where the average price is more than 2000.
select category, avg(price) as average_price
from products 
group by category
having avg(price) > 2000;

-- Q8. Find the total price of products per city, sorted from highest to lowest.
select city, sum(price) as total_price
from products
group by city
order by total_price DESC;

-- Q9. Find the number of distinct cities the products are available in.
select count(distinct city) as number_of_cities
from products;


/* ============================================================
   SECTION B: TEXT FUNCTIONS
   ============================================================ */

-- Q1. Display all product names in uppercase and lowercase.
select 
upper(product_name) as uppercase_name,
lower(product_name) as lowercase_name
from products;

-- Q2. Remove the extra spaces from the product_name column and display the cleaned result.
select trim(product_name) as cleaned_product_name
from products;

-- Q3. Find the length of each product_name (after removing spaces).
select product_name,
length(trim(product_name)) as product_name_length
from products;

-- Q4. Extract the first 5 characters of each description.
select substring(description, 1, 5) as first_5_characters
from products;

-- Q5. Combine product_name and category into a single column separated by a hyphen.
select concat(product_name, ' - ', category) as product_category
from products;

-- Q6. Replace the word 'table' with 'desk' in the description column.
select replace(description, 'table', 'desk') as updated_description
from products;

-- Q7. Convert each product_name into proper case (first letter capital, rest lowercase).
SELECT CONCAT(
UPPER(LEFT(TRIM(product_name), 1)),
LOWER(SUBSTRING(TRIM(product_name), 2))
) AS proper_case_name
FROM products;

-- Q8. Find all products whose description contains the word 'wireless'.
select * from products
where description like '%wireless%';

-- Q9. Find all products whose product_name starts with the letter 'B' (case-insensitive).
select * from products
where lower(product_name) like 'b%';

