use myemployees;
-- 查询表中的单个字段
SELECT last_name FROM employees;

-- 查询表中的多个字段
SELECT last_name, salary, email 
FROM employees;

-- 查询表中的所有字段
SELECT *
FROM employees;

-- 查询各种形式
SELECT 100;
SELECT '';
SELECT 100 * 98;
SELECT version();

-- 起别名 方式1
SELECT 100%98 AS result;
SELECT 
last_name AS 姓, 
first_name AS 名
FROM employees;
-- 方式2
SELECT last_name 姓
FROM employees;

SELECT salary "out put" 
FROM employees;
 
-- 去重
SELECT DISTINCT department_id 
FROM employees;

-- +号的作用, 员工名和姓连接成一个字段，显示为姓名
-- SELECT last_name+first_name AS 姓名
-- FROM employees;
SELECT concat(last_name, first_name) AS 姓名
FROM employees;

-- 显示表departments的结构
DESC departments;

-- ifnull()
SELECT ifnull(commission_pct, 0) AS result, commission_pct
FROM employees; 