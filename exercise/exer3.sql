-- 查询工资最低的员工信息
SELECT *
FROM employees
WHERE salary = (
    SELECT min(salary)
    FROM employees
);

-- 查询平均工资最低的部门信息
/* SELECT d.*
FROM departments d
JOIN (
    SELECT min(ag_dep.ag), ag_dep.department_id AS id
    FROM (
        SELECT avg(salary) ag, department_id
        FROM employees
        GROUP BY department_id
    ) ag_dep
    GROUP BY ag_dep.department_id
    ORDER BY min(ag_dep.ag)
    LIMIT 0, 1
) e
ON d.department_id = e.id */

select *
from departments
where department_id = (
    select department_id
    from employees
    group by department_id
    order by avg(salary)
    limit 1
);

-- 查询平均工资最低的部门信息和该部门的平均工资
/* SELECT d.*, avg(salary)
FROM departments d
JOIN (
    SELECT min(ag_dep.ag), ag_dep.department_id AS id
    FROM (
        SELECT avg(salary) ag, department_id
        FROM employees
        GROUP BY department_id
    ) ag_dep
    GROUP BY ag_dep.department_id
    ORDER BY min(ag_dep.ag)
    LIMIT 0, 1
) AS e
ON d.department_id = e.id
JOIN employees m
ON d.department_id = m.department_id
GROUP BY d.department_id, d.department_name, d.manager_id, d.location_id */

select d.*, e.ag
from departments d
join (
    select department_id, avg(salary) as ag
    from employees
    group by department_id
    order by avg(salary)
    limit 1
) e
on d.department_id = e.department_id;

-- 查询平均工资最高的job信息
select j.*
from jobs j
join (
    select job_id
    from employees
    group by job_id
    order by avg(salary) desc
    limit 1
) e
on e.job_id = j.job_id;

-- 查询平均工资高于公司平均工资的部门有哪些
select department_id
from employees e
group by department_id
having avg(e.salary) > (
    select avg(salary)
    from employees
);

-- 查询出公司中所有manager的详细信息
/* select distinct m.employee_id, m.last_name
from employees e, employees m
where e.manager_id = m.employee_id */

select employee_id, last_name
from employees
where employee_id = any (
    select distinct manager_id
    from employees
);

-- 各个部门中最高工资中最低的那个部门的最低工资是多少
select max(salary)
from departments d
join employees e
on d.department_id = e.department_id
group by e.department_id
order by max(salary)
limit 1;

-- 查询平均工资最高的部门的manager的详细信息： last_name, department_id, email, salary
select last_name, department_id, email, salary
from employees
where email = (
    select distinct email
    from employees
    group by email
    order by avg(salary) desc
    limit 1
);