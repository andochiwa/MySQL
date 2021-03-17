
出现在其他语句中的select语句都称为子查询或内查询
外部的查询语句，称为主查询或外查询

分类：
按子查询出现的位置
    select后面
        仅支持标量子查询
    from后面
        支持表子查询
    where或having后面（重点）
        标量子查询
            一般搭配单行操作符使用
            > < >= <= = <>
        列子查询
            一般搭配多行操作符使用
            IN, any/some, ALL
        行子查询（较少）
    exists后面（相关子查询）
        表子查询

按结果集的行列数不同
    标量子查询（结果集只有一行一列）
    列子查询（结果集有一列多行）
    行子查询（结果集有一行多列）
    表子查询（结果集一般为多行多列）;



---- 标量子查询
-- 谁的工资比Abel高
SELECT *
FROM employees
WHERE salary > (
    SELECT salary
    FROM employees
    WHERE last_name = 'Abel'
);

-- 返回job_id与141号员工相同，salary比143号员工多的员工信息
SELECT *
FROM employees
WHERE job_id = (
    SELECT job_id
    FROM employees
    WHERE employee_id = '141'
) AND salary > (
    SELECT salary
    FROM employees
    WHERE employee_id = '143'
);

-- 返回公司工资最少的员工的last_name, job_id和salary
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (
    SELECT min(salary)
    FROM employees
);

-- 查询最低工资大于部门50最低工资的部门id和其最低工资
SELECT department_id, min(salary)
FROM employees
GROUP BY department_id
HAVING min(salary) > (
    SELECT min(salary)
    FROM employees
    WHERE department_id = 50
);


---- 列子查询（多行子查询）
-- 返回location_id是1400或1700的部门中所有员工姓名
SELECT last_name
FROM employees
WHERE department_id IN(
    SELECT DISTINCT department_id
    FROM departments
    WHERE location_id in(1400, 1700)
);

-- select last_name
-- from employees e
-- join departments d
-- on e.department_id = d.department_id
-- where location_id in(1400, 1700);

-- 返回其他工种中比job_id为'IT_PROG'工种任意工资低的员工的：工号，姓名，job_id和salary
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary < ANY(
    SELECT DISTINCT salary
    FROM employees
    WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG';

---- 行子查询
-- 查询员工编号最小且工资最高的员工信息
SELECT *
FROM employees
WHERE employee_id = (
    SELECT min(employee_id)
    FROM  employees
) AND salary = (
    SELECT max(salary)
    FROM employees
);

SELECT *
FROM employees
WHERE (employee_id, salary) = (
    SELECT min(employee_id), max(salary)
    FROM employees
);

---- select后面
-- 查询每个部门的员工个数
SELECT d.*, (
    SELECT count(*)
    FROM employees e
    WHERE e.department_id = d.department_id
) AS 个数
FROM departments d;

-- 查询员工号=102的部门名
SELECT (
    SELECT department_name
    FROM departments d
    JOIN employees e
    ON e.department_id = d.department_id
    WHERE e.employee_id = 102
);

SELECT department_name
FROM departments d
JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id = 102;

---- from后面
-- 查询每个部门的平均工资的工资等级
SELECT ag_dep.*, grade_level
FROM (
    SELECT avg(salary) ag, department_id
    FROM employees
    GROUP BY department_id
) ag_dep
JOIN job_grades g
ON ag_dep.ag BETWEEN g.lowest_sal AND g.highest_sal;

---- exists后面（相关子查询）
-- 查询员工名的部门名
SELECT department_name
FROM departments d
WHERE EXISTS(
    SELECT *
    FROM employees e
    WHERE d.department_id = e.department_id
);