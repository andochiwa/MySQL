select last_name, email, department_name
from employees e
join departments d
on e.department_id = d.department_id
where e.last_name like '%m%';

-- view
create view v1 as
select last_name, email, department_name
from employees e
join departments d
on e.department_id = d.department_id;

select *
from v1
where last_name like '%m%';