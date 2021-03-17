------ 内连接

SELECT list
FROM table1
INNER JOIN table2
ON condition;

---- 等值连接
-- 查询员工名，部门名
SELECT employee_id, department_name
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id;

-- 查询名字中包含e的员工名和工种名（筛选）
SELECT employee_id, job_title
FROM employees AS e
INNER JOIN jobs AS j
ON e.job_id = j.job_id
WHERE employee_id LIKE '%e%';

-- 查询部门个数>3的城市名和部门个数（分组+筛选）
SELECT city, count(*)
FROM locations AS l
INNER JOIN departments AS d
ON d.location_id = l.location_id
GROUP BY city
HAVING count(*) > 3;

-- 查询部门员工个数>3的部门名和员工个数，并按个数降序
SELECT department_name, count(*)
FROM departments AS d
INNER JOIN employees AS e
ON d.department_id = e.department_id
GROUP BY department_name
HAVING count(*) > 3
ORDER BY count(*) DESC;

-- 查询员工名，部门名，工种名，按部门名降序
SELECT employee_id, d.department_name, job_title
FROM employees AS e
INNER JOIN departments AS d
ON e.department_id = d.department_id
INNER JOIN jobs AS j
ON e.job_id = j.job_id
ORDER BY d.department_name DESC;

---- 非等值连接
-- 查询员工的工资级别
SELECT salary, grade_level
FROM employees
JOIN job_grades
ON salary BETWEEN lowest_sal AND highest_sal;

-- 查询每个工资级别的个数>20的，按工资级别降序
select grade_level, count(*)
from employees e
join job_grades j
on salary between lowest_sal and highest_sal
group by grade_level
having count(*) > 20
order by grade_level desc;

---- 自连接
--  查询员工的名字，上级的名字
select e.employee_id, e.employee_id as 'Emp', m.employee_id, m.employee_id as 'Mng'
from employees e
join employees m
on e.manager_id = m.employee_id;

---- 左外连接
--- 左外连接， left join左边是主表
--- 右外连接， right join右边是主表
-- 没有男朋友的女神名
use girls;
select g.name, b.*
from beauty g
left join boys b
on g.boyfriend_id = b.id
where b.id is null;

-- 查询哪个部门没有员工
select d.*, employee_id
from departments d
left join employees e
on d.department_id = e.department_id
where employee_id is null;


-- 交叉连接(笛卡尔乘积)
select g.*, b.*
from beauty g
cross join boys b;