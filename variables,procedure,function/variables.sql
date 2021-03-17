-- 查看所有系统变量
--show global|[session] variables
show global variables;

-- 查看满足条件的部分系统变量
--show global|[session] variables like '%char%'
show global variables like '%auto%';

-- 查看某个系统变量的值
--select @@global|[session].系统变量名
select @@global.autocommit;

-- 为某个系统变量赋值
--set global|[session] 系统变量名 = 值;
set global autocommit = 0;
-- 方式2
--set @@global|[session].系统变量名 = 值
set @@global.autocommit = 1;

-- 查看所有的会话变量
show variables;

-- 查看部分的会话变量
show variables like '%char%';
show session variables like '%char%';

-- 查看指定的某个会话变量
select @@transaction_isolation;
select @@session.transaction_isolation;

-- 为某个会话变量赋值
set @@session.transaction_isolation  = 'read-uncommitted';

---- 用户变量
-- 声明
set @name = 'john';
set @count = 1;

-- 赋值
select count(*) into @count
from employees;

-- 查看
select @count;

---- 局部变量(begin end中才能使用)
-- 声明
declare count1 int;
declare count2 int defalut 10;
-- 赋值
select count(*) into count1
from employees;