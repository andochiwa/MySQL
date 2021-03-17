适合返回一个值时使用

语法
create function 函数名(参数列表) returns 返回类型
begin
    函数体
end
set global log_bin_trust_function_creators=TRUE;
delimiter $
---- 无参有返回
-- 返回公司的员工个数
create function f1() returns int
begin
    declare c int default 0;
    select count(*) into c
    from employees;
    return c;
end $
select f1()$

---- 有参有返回
-- 根据员工名返回他的工资
create function f2(employee_name varchar(20)) returns double
begin
    declare s double default 0.0;
    select salary into s
    from employees
    where last_name = employee_name;
    return s;
end $
select f2('kochhar')$
drop function f2;



