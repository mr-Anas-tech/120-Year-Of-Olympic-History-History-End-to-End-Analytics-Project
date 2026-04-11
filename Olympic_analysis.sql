Select * FROM athelet;
Select * FROM region;
---                                                Relationship
Alter table region add primary key ("NOC");

SELECT distinct a."NOC" from athelet a 
left join region as r
ON 
a."NOC"=r."NOC"
where r."NOC" is NULL;
INSERT into region ("NOC","Region") VALUES('SGP','Singapore');
Alter table athelet add constraint fk_noc foreign key ("NOC")
References region ("NOC");




-----TOP 10 country by medal
SELECT r."Region",count(a."Medal") as medal_count
From athelet as a
JOIN region as r
ON r."NOC"=a."NOC"
WHERE  a."Medal" IN(SELECT "Medal" from athelet 
Where "Medal"!='No Medal')
GROUP by r."Region"
order by medal_count desc limit 10;

---Partition TREND
--Male
select "Sex","Year",count("Year") as Total_particiaption
from athelet
WHERE "Sex"='M'
group by "Year","Sex"
order by Total_particiaption desc;
---Female
select "Sex","Year",count("Year") as Total_particiaption
from athelet
WHERE "Sex"='F'
group by "Year","Sex"
order by Total_particiaption desc;

--TOP ATHELETES
select "Name","Sex",count("Medal") AS total_medal,"Region"
FROM athelet as a
JOIN region as r
ON a."NOC"=r."NOC"
WHERE "Medal"!='No Medal'
GROup by "Name","Sex","Region" 
order by total_medal desc;
--Pak_Athelets
select "Name","Sex",a."Sport",count("Medal") AS total_medal,"Region"
FROM athelet as a
JOIN region as r
ON a."NOC"=r."NOC"
WHERE "Medal"!='No Medal'  AND "Region"='Pakistan'
GROup by "Name","Sex","Region",a."Sport"
order by total_medal desc;
--TOP Athelet with medal of unique events
select "Name","Event",count("Medal") AS total_medal
FROM athelet as a
JOIN region as r
ON a."NOC"=r."NOC"
WHERE "Medal"!='No Medal'
GROup by "Name","Event"
order by total_medal desc;

--Master Analysis
SELECT a."Name",a."Sex",r."Region",a."Sport",
        COUNT(CASE when a."Medal"='Gold' THEN 1 END) AS G0ld_medal,
		COUNT(CASE when a."Medal"='Silver' THEN 1 end) AS Silver_medal,
		COUNT(Case WHEN a."Medal"='Bronze' THEN 1 end) as Bronze_medal,
		COUNT(a."Medal") as Total_medals
FROM athelet as a
JOIN region as r
ON a."NOC"=r."NOC"
WHERE a."Medal" !='No Medal'
GROUP BY a."Name",a."Sex",r."Region",a."Sport"
ORDER by Total_medals desc;
---Weight and Height Analysis
SELECT "Name","Sport",Avg("Height") AS Average_Height,
AVG("Weight") AS Average_Weight,
COUNT("Medal") As total_Medal
FROM athelet
WHERE "Medal"!='No Medal'
GROUP BY "Name","Sport"
order by total_Medal desc;

-- medalist VS Non medalist
SELECT 
      CASE WHEN
	  "Medal"='No Medal' THEN 'NON_MEDALIST'
	  ELSE 'MEDALIST'
	  END AS Athlete_Status,
	  AVG("Height") AS AVG_HEIGHT,
	  AVG("Weight") AS AVG_WEIGHT,
	  AVG("Age")    AS AGE_Status,
	  COUNT(*) TOTAL_Athelets
	  FROM athelet
	  GROUP BY 1;

--total_medal
SELECT Count("Medal") as total
FROM athelet
Where "Medal"!='No Medal';
--Country by medal by every year
SELECT a."Year",r."Region",count("Medal") AS total_medal
FROM athelet AS a
JOIN region as r
ON a."NOC"=r."NOC"
Where "Medal"!='No Medal'
Group by "Year","Region"
Order by total_medal desc;

-- Athlete Partition Vs Success rate.

select a."Year",r."Region",count(a."Year") as Total_particiaption,count( case when a."Medal"!='No Medal' then 1 end) as Total_Medal
from athelet as a
JOIN region AS r
ON a."NOC"=r."NOC"
group by a."Year",r."Region"
order by "Year";