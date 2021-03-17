---- if(condition, true, false): if else效果
SELECT if(10 > 5, 'big', 'small');
select last_name, commission_pct ,if(commission_pct is null, '没奖金', '有奖金') as remarks
from employees;

---- case: switch case效果
-- 查询员工的工资，要求
-- department_id = 30, salary * 1.1
-- department_id = 40, salary * 1.2
-- department_id = 50, salary * 1.3
select salary, department_id,
case department_id
when 30 then salary * 1.1
when 40 then salary * 1.2
when 50 then salary * 1.3
else salary
end as"new salary"
from employees
order by department_id;

---- case when end
-- 查询员工工资
-- if salary > 20000, show A
-- if salary > 15000, show B
-- if salary > 10000, show C
-- other D
select salary,
case
when salary > 20000 then 'A'
when salary > 15000 then 'B'
when salary > 10000 then 'C'
else 'D'
end AS"salary level"
FROM employees;
