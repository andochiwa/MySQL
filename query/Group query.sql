
SELECT 分组函数， 列（要求出现在group by的后面）
FROM 表
[where 条件]
GROUP BY 分组列表
[order BY 从句]

having 用在表中没有数据时;

-- 查询每个工种的最高工资
SELECT max(salary), job_id
FROM employees
GROUP BY job_id;

-- 查询每个位置的部门个数
SELECT count(*), location_id
FROM departments
GROUP BY location_id;

---- 添加筛选条件
-- 查询邮箱中包含a字符的，每个部门的平均工资
SELECT avg(salary), department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;

-- 查询有奖金的每个领导手下员工的最高工资
SELECT max(salary), manager_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY manager_id;

------ 分组后筛选， having
---- 添加复杂筛选条件
-- 查询哪个部门的员工个数大于2
select count(*) as people_number, department_id
from employees
group by department_id
having people_number > 2;

-- 查询每个工种有奖金的员工的最高工资>12000的工种编号和最高工资
select max(salary) as max_salary, employee_id
from employees
where commission_pct is not null
group by employee_id
having max_salary > 12000;

-- 查询领导编号>102的每个领导手下的最低工资>5000的领导编号
select min(salary), manager_id
from employees
where manager_id > 102
group by manager_id
having min(salary) > 5000;

---- 按表达式（函数）分组
-- 按员工姓名长度分组，查询每组员工个数，筛选员工个数>5
select count(*), length(last_name)
from employees
group by length(last_name)
having count(*) > 5;

---- 按多个字段分组， 排序
-- 查询每个部门每个工种的员工的平均工资，并按平均工资高低排序
select avg(salary), department_id, job_id
from employees
where department_id is not null
group by job_id, department_id
having avg(salary) > 10000
order by avg(salary) desc;
