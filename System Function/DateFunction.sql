-- now 返回当前日期+时间
SELECT now();

-- curdate 返回日期，不包含时间
SELECT curdate();

-- curtime 返回时间，不包含时期
SELECT curtime();

-- 获取年、月、日、小时、分钟、秒
SELECT year(now()) AS year;
SELECT year('1998-1-1') AS year;
SELECT year(hiredate) AS year FROM employees;

SELECT month(now()) month;
SELECT monthname(now()) month;

-- str_to_date 将日期格式字符转为指定格式的日期
SELECT str_to_date('1998-3-2', '%Y-%c-%d') as output;
select *
from employees
where hiredate = str_to_date('4-3 1992', '%c-%d %Y');

#date_format
select date_format(now(), '%y年%m月%d日') as output;