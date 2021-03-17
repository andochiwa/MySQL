
条件查询
模糊查询 LIKE, BETWEEN AND, IN, IS NULL;

use myemployees;

---- 按条件表达式筛选## 
-- 工资>12000
SELECT *
FROM employees
WHERE salary > 12000;

-- 部门编号不等于90号的员工名和部门编号
SELECT last_name, department_id
FROM employees
WHERE department_id <> 90;

---- 按逻辑表达式筛选##
-- 查询工资在10000-20000之间的员工名，工资和奖金
SELECT
    last_name,
    salary,
    commission_pct
FROM employees
WHERE salary >= 10000 AND salary <= 20000;

-- 查询部门编号不在90-110或工资高于15000的员工信息
SELECT *
FROM employees
WHERE department_id < 90 OR department_id > 100 OR salary >= 15000;

##模糊查询
###like
/*
通配符:
%: 匹配任意个字符，  
_: 匹配单个字符
*/
-- 查询员工中包含字符a的员工信息 
SELECT *
FROM employees
WHERE last_name LIKE '%a%';

-- 查询员工名中第三个字符为n，第五个字符为l的员工名和工资
SELECT last_name, salary
FROM employees
WHERE last_name LIKE '__n_l%';

-- 查询员工名中第二个字符为_的员工名
-- 转义匹配 escape
SELECT last_name
FROM employees
WHERE last_name LIKE '_$_%' escape '$';

#BETWEEN AND 查询员工编号在100-120的员工信息
SELECT *
FROM employees
WHERE employee_id BETWEEN 100 AND 120;

#in 查询员工的工种编号是IT_PROG, AD_VP, AD_PRES中的一个员工号和工种编号
SELECT last_name, job_id
FROM employees
/* WHERE job_id = 'IT_PROG' OR job_id = 'AD_VP' OR job_id = 'AD_PRES' */
WHERE job_id in('IT_PROG', 'AD_VP', 'AD_PRES');

-- is null 判断没有奖金的员工
select *
from employees
where commission_pct is null;

---- 安全等于 <=> 可以判断null
select *
from employees
where commission_pct <=> null;