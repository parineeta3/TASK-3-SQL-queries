use superstore;
CREATE TABLE sales (
    Invoice_ID VARCHAR(20) PRIMARY KEY,
    Branch CHAR(1),
    City VARCHAR(50),
    Customer_type VARCHAR(20),
    Gender VARCHAR(10),
    Product_line VARCHAR(100),
    Unit_price DECIMAL(10,2),
    Quantity INT,
    Tax_5 DECIMAL(10,2),
    Total DECIMAL(10,2),
    Order_Date DATE,
    Order_Time TIME,
    Payment VARCHAR(20),
    cogs DECIMAL(10,2),
    gross_margin_percentage DECIMAL(5,2),
    gross_income DECIMAL(10,2),
    Rating DECIMAL(3,1),
    Day_Name VARCHAR(20),
    Month_Name VARCHAR(20),
    Order_Year INT
);

Select * from sales limit 10;
##Show all sales where total > 500
select * from sales where Total > 500;
##Top 5 highest sales transactions:
select Invoice_ID , Total from sales order by Total desc limit 5;
#Second highest sale
select max(Total) from sales where Total < (select max(Total) from sales);
#Total sales by customer type 
select Customer_type , sum(Total) as Total_amount from sales group by Customer_type;
#Total sales per branch 
SELECT Branch, SUM(Total) AS Total_Sales
FROM sales
GROUP BY Branch
ORDER BY Total_Sales DESC;
#Top 5 products by total sales 
select Product_line, sum(Total) as Total_Sales from sales 
group by Product_line 
order by Total_sales desc
limit 5;
#Average rating per product line:
SELECT Product_line, ROUND(AVG(Rating),2) AS Avg_Rating
FROM sales
GROUP BY Product_line
ORDER BY Avg_Rating DESC;

##Monthly sales:
SELECT Month_Name, SUM(Total) AS Monthly_Sales
FROM sales
GROUP BY Month_Name
ORDER BY Month_Name;
##Sales by payment method:
SELECT Payment, COUNT(*) AS Transactions, SUM(Total) AS Revenue
FROM sales
GROUP BY Payment
ORDER BY Revenue DESC;

select distinct(Invoice_ID) as ID , sum(Total) as Revenue from sales 
group by Invoice_ID 
Having Revenue > 600  order by Revenue desc;








