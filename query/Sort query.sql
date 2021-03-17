-- 工资从高到低
SELECT *
FROM employees
ORDER BY salary DESC;

-- 部门编号>=90的员工信息，按入职时间的先后排序
SELECT *
FROM employees
WHERE department_id >= 90
ORDER BY hiredate ASC;

-- 按表达式排序
-- 按年薪
SELECT *, salary * 12 * (1 + ifnull(commission_pct, 0)) AS annualSalary
FROM employees
ORDER BY annualSalary;

-- 按姓名长度显示员工的姓名与工资
SELECT length(last_name) nameSize, last_name, salary
FROM employees
ORDER BY nameSize DESC;

-- 先按工资排序，再按员工编号排序
SELECT *
FROM employees
ORDER BY salary, employee_id;

SELECT last_name, salary
FROM employees
WHERE salary NOT BETWEEN 8000 AND 17000
ORDER BY salary DESC;

SELECT *, length(email)
FROM employees
WHERE email LIKE '%e%'
ORDER BY length(email) DESC, department_id ASC;