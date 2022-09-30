--fetching all records
select * from basic_pays order by salary asc

--for min,max,average and total salary for all employees in every year
select fiscal_year, 
round(min(salary)) as min_sal, round(max(salary)) as max_sal,
round(avg(salary)) as avg_sal, round(sum(salary)) as total_sal
from basic_pays
group by fiscal_year order by fiscal_year ASC


--creating a expression using case statement
SELECT 
CASE WHEN SALARY <=5000 THEN 'low_salary'
WHEN SALARY > 5000 AND SALARY <=15000 THEN 'medium_salary'
else 'high_salary' end as salary_grp,
COUNT(employee_id) 
FROM basic_pays 
GROUP BY salary_grp 
order by COUNT(employee_id) ASC

--if database doesn't support grouping by aliases
SELECT 
CASE WHEN SALARY <=5000 THEN 'low_salary'
WHEN SALARY > 5000 AND SALARY <=15000 THEN 'medium_salary'
else 'high_salary' end as salary_grp,
COUNT(employee_id) 
FROM basic_pays 
GROUP BY 
CASE WHEN SALARY <=5000 THEN 'low_salary'
WHEN SALARY > 5000 AND SALARY <=15000 THEN 'medium_salary'
else 'high_salary' end
order by COUNT(employee_id) ASC

--using CTE 
with salary_data AS
(SELECT *,
CASE WHEN SALARY <=5000 THEN 'low_salary'
WHEN SALARY > 5000 AND SALARY <=15000 THEN 'medium_salary'
else 'high_salary' end as salary_grp
FROM basic_pays)
select salary_grp, count(employee_id) from salary_data
group by salary_grp order by count(employee_id) ASC

