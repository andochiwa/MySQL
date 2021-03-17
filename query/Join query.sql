## 连接查询（多表查询）

内连接:
    等值连接
    非等值连接
    自连接
外连接
    左外连接
    右外连接
    全外连接
交叉连接;

use girls;
use myemployees;
------ 等值连接
-- 查询女对应男名
SELECT name, boyname
FROM beauty, boys
WHERE beauty.boyfriend_id = boys.id;

-- 查询员工名对应的部门名
SELECT last_name, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

---- 为表起别名
-- 查询员工名， 工种号， 工种名
SELECT last_name, e.job_id, job_title
FROM employees AS e, jobs AS j
WHERE e.job_id = j.job_id;

---- 加筛选
-- 查询有奖金的员工名和部门名
SELECT last_name, department_name, commission_pct
FROM employees AS e, departments AS d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL;

-- 查询城市名中第二个字符为o的部门名和城市名
SELECT department_name, city
FROM departments AS d, locations AS l
WHERE d.location_id = l.location_id
AND city LIKE '_o%';

---- 加分组
-- 查询每个城市的部门个数
SELECT count(*), city
FROM locations AS l, departments d
WHERE d.location_id = l.location_id
GROUP BY city;

-- 查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT min(salary), department_name, d.manager_id
FROM employees AS e, departments AS d
WHERE d.department_id = e.department_id
AND e.commission_pct IS NOT NULL
GROUP BY  department_name, d.manager_id;

---- 加排序
-- 查询每个工种的工种名和员工的个数， 并且按员工的个数排序
select job_title, count(*)
from employees as e, jobs as j
where e.job_id = j.job_id
group by job_title
order by count(*) desc;

---- 三表连接
-- 查询员工名， 部门名， 所在城市
select last_name, department_name, city
from employees as e, departments as d, locations as l
where e.department_id = d.department_id
and d.location_id = l.location_id
and city like 's%'
order by department_name desc;

------ 非等值连接
-- 查询员工的工资和工资级别
select salary, grade_level
from employees as e, job_grades as g
where salary between g.lowest_sal and g.highest_sal
and g.grade_level = 'E';

---- 自连接
-- 查询员工名和上级的名字
select e.employee_id, e.last_name as "Emp", m.employee_id as "Mgr", m.last_name
from employees as e, employees as m
where e.manager_id = m.employee_id;
