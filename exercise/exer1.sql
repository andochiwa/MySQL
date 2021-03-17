select grade_level, count(*)
from employees e
join job_grades j
on salary between lowest_sal and highest_sal
group by grade_level
having count(*) > 20
order by grade_level desc;

select e.last_name as "manager_name", e.employee_id as "manager_id", m.last_name as "employee_name", m.employee_id as "employee_id"
from employees e
join employees m
on e.manager_id = m.employee_id;

-- 查询编号>3的女神的男朋友信息，如果有则列出详细，没有则用null填充
select g.name, b.*
from beauty g
left join boys b
on g.boyfriend_id = b.id
where g.id > 3;

-- 查询哪个城市没有部门
select l.city
from locations l
left join departments d
on d.location_id = l.location_id
where d.department_id is null;

-- 查询部门名为SAL和IT的员工
select e.*, d.department_name
from employees e
join departments d
on e.department_id = d.department_id
where d.department_name in('SAL', 'IT');