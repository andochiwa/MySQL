
讲多条查询语句的结果合并成一个;


-- 查询部门编号>90或者邮箱包含a的员工信息
select *
from employees
where department_id > 90 or email like '%a%';

select * from employees where email like '%a%'
union
select * from employees where department_id > 90;