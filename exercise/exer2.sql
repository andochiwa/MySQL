-- 查询和zlotkey相同部门id的员工姓名和工资
SELECT last_name, salary
FROM employees
WHERE department_id = (
    SELECT department_id
    FROM employees
    WHERE last_name = 'zlotkey'
);

-- 查询工资比平均工资高的员工的员工号，姓名和工资
SELECT last_name, employee_id, salary
FROM employees
WHERE salary > (
    SELECT avg(salary)
    FROM employees
);

-- 查询各部门中工资比本部门平均工资高的员工的员工号，姓名和工资
SELECT employee_id, last_name, salary
FROM employees e
JOIN (
    SELECT avg(salary) avg_salary, department_id
    FROM employees
    GROUP BY department_id
) d
ON e.department_id = d.department_id
WHERE e.salary > d.avg_salary;

-- 查询姓名中包含字母u的员工在相同部门的员工的员工号和姓名
SELECT employee_id, last_name
FROM employees
WHERE department_id IN(
    SELECT DISTINCT department_id
    FROM employees 
    WHERE last_name LIKE '%u%'
);

-- 查询在部门的location_id为1700的部门工作的员工和员工号
SELECT last_name, employee_id
FROM employees e
WHERE department_id = ANY(
    SELECT DISTINCT department_id
    FROM departments
    WHERE location_id = 1700
);

-- 查询管理者是king的员工姓名和工资
SELECT last_name, salary
FROM employees
WHERE manager_id IN(
    SELECT employee_id
    FROM employees
    WHERE last_name = 'k_ing'
);

-- 查询工资最高的员工姓名，要求first_name和last_name显示为一列， 列名为姓 名
SELECT concat(first_name, ' ', last_name)
from employees
where salary = (
    select max(salary)
    from employees
);
