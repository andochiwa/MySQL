/*
sum, avg, max, min, count
*/
select sum(salary), round(avg(salary), 2), max(salary), min(salary), count(salary) 
from employees;

-- 可以和distinct搭配去重
select sum(distinct salary), sum(salary)
from employees;
select count(distinct salary), count(salary)
from employees;

---- count的详细
select count(commission_pct) from employees;
select count(*) from employees;
select count(1) from employees;

---- 和分组函数一同查询的字段要求是group by的字段