select *  from Zepto_Grocery_Data
 
-- Key performances indicator

-- Total sales

select concat(cast(sum(total_sales)/1000000 as decimal (10,2)),'M')
as Overall_Sales 
from Zepto_Grocery_Data 

-- Avg sales

select cast(Avg(total_sales) as decimal (10,0))
as Avg_sales 
from Zepto_Grocery_Data


-- Number of item
select count(*) as Number_of_Item 
from Zepto_Grocery_Data 

-- Avg Rating

select cast(Avg(rating) as decimal (10,2)) as Avg_Rating 
from Zepto_Grocery_Data



-- Toatl Sales by Fat Content

select  Item_Fat_Content, 
	cast(sum(Total_Sales)/1000 as decimal (10,2)) 
	as Total_Sales,
	cast(Avg(total_sales) as decimal (10,0)) as Avg_sales ,
	count(*) as Number_of_Item ,
	cast(Avg(rating) as decimal (10,2)) as Avg_Rating 
from Zepto_Grocery_Data 
group by Item_fat_Content

-- Total Sales by Item Type

select  Item_Type,
	cast(sum(Total_Sales)as decimal (10,2)) 
	as Total_Sales,
	cast(Avg(total_sales) as decimal (10,0)) as Avg_sales ,
	count(*) as Number_of_Item ,
	cast(Avg(rating) as decimal (10,2)) as Avg_Rating 
from Zepto_Grocery_Data 
group by Item_Type
order by Total_Sales desc

-- Fat Content by Outlet for Total Sales

SELECT Outlet_Location_Type, 
       ISNULL([Low Fat], 0) AS Low_Fat, 
       ISNULL([Regular], 0) AS Regular
FROM 
(
    SELECT Outlet_Location_Type, Item_Fat_Content, 
           CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales
    FROM Zepto_Grocery_Data 
    GROUP BY Outlet_Location_Type, Item_Fat_Content
) AS SourceTable
PIVOT 
(
    SUM(Total_Sales) 
    FOR Item_Fat_Content IN ([Low Fat], [Regular])
) AS PivotTable
ORDER BY Outlet_Location_Type;


-- Total Sales by Outlet Establishment

SELECT Outlet_Establishment_Year, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    cast(Avg(total_sales) as decimal (10,0)) as Avg_sales ,
	count(*) as Number_of_Item ,
	cast(Avg(rating) as decimal (10,2)) as Avg_Rating 
    FROM Zepto_Grocery_Data 
    GROUP BY Outlet_Establishment_Year

     
--Sales by Outlet Location:

SELECT Outlet_Location_Type, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    cast(Avg(total_sales) as decimal (10,0)) as Avg_sales ,
	count(*) as Number_of_Item ,
	cast(Avg(rating) as decimal (10,2)) as Avg_Rating 
    FROM Zepto_Grocery_Data 
   -- where Outlet_Establishment_Year = 2022
    GROUP BY Outlet_Location_Type
    order by Total_Sales Desc


-- All Metrics by Outlet Type

SELECT Outlet_Type, 
    CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS Total_Sales,
    cast(Avg(total_sales) as decimal (10,0)) as Avg_sales ,
	count(*) as Number_of_Item ,
	cast(Avg(rating) as decimal (10,2)) as Avg_Rating 
    FROM Zepto_Grocery_Data 
   -- where Outlet_Establishment_Year = 2022
    GROUP BY Outlet_Type
    order by Total_Sales Desc




