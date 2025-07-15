-- using the blinkit_db database
use blinkit_db;

--checking the data available in the table
select *  from blinkit_data;

--data cleaning
update blinkit_data set Item_Fat_Content = 
case 
when Item_Fat_Content in ('LF', 'low fat') THEN 'Low Fat'
when Item_Fat_Content ='reg' THEN 'Regular'
else Item_Fat_Content
end;

-- to check if there are any other ambiguous values within the selected column
select distinct Item_Fat_Content from blinkit_data;

-- checking the total amount of sales made in the form of millions
select concat(cast(sum(sales)/1000000 as decimal(10,2)), 'M') as total_sales_millions from blinkit_data;

--checking the average amount of sales made 
select cast(avg(sales) as decimal(10,0)) as Avg_Sales from blinkit_data;

-- total number of items available in the data
select count(*) as no_of_items  from blinkit_data;

--checking the average rating which the sold items recieved
select cast(avg(rating) as decimal(10,2))as avg_rating from blinkit_data;

--calculating various metrics based on different item fat content
select item_fat_content , 
concat(cast(sum(sales)/1000000 as decimal(10,2)), 'M') as total_sales,
cast(avg(sales) as decimal(10,0)) as Avg_Sales,
cast(avg(rating) as decimal(10,2))as avg_rating,
count(*) as no_of_items 
from blinkit_data
group by item_fat_content 
order by total_sales desc;

--calculating various metrics based on different types of items.
select Item_Type , 
concat(cast(sum(sales)/1000 as decimal(10,2)), 'K') as total_sales,
cast(avg(sales) as decimal(10,0)) as Avg_Sales,
cast(avg(rating) as decimal(10,2))as avg_rating,
count(*) as no_of_items 
from blinkit_data
group by Item_Type 
order by total_sales desc;

--calculating various metrics based on different outlet location type and fat content present.
select Outlet_Location_Type , item_fat_content ,
concat(cast(sum(sales)/1000 as decimal(10,2)), 'K') as total_sales,
cast((sum(sales)*100/sum(sum(sales))over()) as decimal(10,2)) as sales_percentage,
cast(avg(sales) as decimal(10,0)) as Avg_Sales,
cast(avg(rating) as decimal(10,2))as avg_rating,
count(*) as no_of_items 
from blinkit_data
group by Outlet_Location_Type , item_fat_content 
order by total_sales desc;

--calculating various metrics based on establishment year of different outlets. 
select Outlet_Establishment_Year ,
concat(cast(sum(sales)/1000 as decimal(10,2)), 'K') as total_sales,
cast((sum(sales)*100/sum(sum(sales))over()) as decimal(10,2)) as sales_percentage,
cast(avg(sales) as decimal(10,0)) as avg_Sales,
cast(avg(rating) as decimal(10,2))as avg_rating,
count(*) as no_of_items 
from blinkit_data
group by Outlet_Establishment_Year 
order by total_sales desc;

--calculating various metrics based on different tiers of outlet location .
select Outlet_Location_Type ,
concat(cast(sum(sales)/1000 as decimal(10,2)), 'K') as total_sales,
cast((sum(sales)*100/sum(sum(sales))over()) as decimal(10,2)) as sales_percentage,
cast(avg(sales) as decimal(10,0)) as avg_Sales,
cast(avg(rating) as decimal(10,2))as avg_rating,
count(*) as no_of_items 
from blinkit_data
group by Outlet_Location_Type 
order by total_sales desc;

--calculating various metrics based on different types of outlets
select Outlet_Type ,
concat(cast(sum(sales)/1000 as decimal(10,2)), 'K') as total_sales,
cast((sum(sales)*100/sum(sum(sales))over()) as decimal(10,2)) as sales_percentage,
cast(avg(sales) as decimal(10,0)) as avg_Sales,
cast(avg(rating) as decimal(10,2))as avg_rating,
count(*) as no_of_items 
from blinkit_data
group by Outlet_Type 
order by total_sales desc;

--calculating various metrics based on outlet sizes
select outlet_size,
cast(sum(sales)/1000 as decimal(10,2)) as total_sales,
cast((sum(sales)*100/sum(sum(sales))over()) as decimal(10,2)) as sales_percentage
from blinkit_data
group by outlet_size
order by total_sales desc;

-- segregating the data to calculate total sales based on item fat content and outlet location type 
select Outlet_Location_Type, 
isnull([Low Fat],0) as Low_fat,
isnull([Regular],0) as Regular
from (
select Outlet_Location_Type , item_fat_content ,
cast(sum(sales)/1000 as decimal(10,2)) as total_sales
from blinkit_data
group by Outlet_Location_Type , item_fat_content 
)as SourceTable
PIVOT
(
sum(total_sales) 
for item_fat_content in([Low Fat], [Regular])
) as PivotTable
order by outlet_location_type;
