--Show all the data
select * from videogamenalysis

--What is the most highest salable video game in present year
select name,platform,publisher,north_america_sales,europe_sales,
japan_sales,other_sales,global_sales
from videogamenalysis
where year = 2020
order by global_sales desc

--what platform do has the less salable in the present year
select platform
from videogamenalysis
where year = 2020

--base on the highest sales is there a chances that other 
--game connected to it has a lowest sales
select name,global_sales
from videogamenalysis
where global_sales is not null
order by global_sales desc

--identify if there are different "Wii Sport"
--(answer question number 3)
select name, global_sales
from videogamenalysis
where name like '%Wii Sport%'

--what genre is the most salable world wide 
select genre,sum(global_sales) as total_sales_globally
from videogamenalysis
where global_sales is not null
group by genre
order by total_sales_globally desc

--what publisher is the most outdated? and base on 
--its outdated it is still salable (top 5 video games)
select year, publisher, count (publisher) as total_sales,
sum(global_sales) as total_global_sales
from videogamenalysis
where year >= 1980 and year <= 1999
group by year, publisher
order by count (publisher) desc
limit 5

