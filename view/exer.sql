-- 查询姓名中包含a字符的员工名、部门名和工种信息
create view exerv1 as
select last_name, department_name, job_title
from employees e
join departments d
on e.department_id = d.department_id
join jobs j
on e.job_id = j.job_id;

select *
from exerv1
where last_name like '%a%';

-- 查询各部门的平均工资级别
create view exerv2 as
select avg(salary) ag, department_id
from employees
group by department_id;

select e.department_id, j.grade_level 
from exerv2 e
join job_grades j
on ag between lowest_sal and highest_sal;

-- 查询平均工资最低的部门信息
select d.*
from departments d
join exerv2 e
on d.department_id = e.department_id
order by e.ag
limit 1;

-- 创建视图emp_v1，要求查询电话号码以011开头的员工姓名，工资和邮箱
create view emp_v1 as
select last_name, salary, email
from employees
where phone_number like '011%';

-- 创建视图emp_v2, 要求查询部门最高工资高于12000的部门信息
create view emp_v2 as
select d.*
from departments d
join (
    select max(salary), department_id
    from employees
    group by department_id
    having max(salary) > 12000
) e
on d.department_id = e.department_id;
