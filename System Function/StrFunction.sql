
常见函数
1. 单行函数
    concat, length, ifnull等
2. 分组函数(统计函数, 聚合函数);

---- 字符函数
-- length
SELECT length('张三jj');

-- concat 拼接字符串
SELECT concat(last_name, '_', first_name) name
from employees;

-- upper, lower
select upper('john');
select lower('joHn');

-- substr, substring 一样 sql索引从1开始
select substr('李莫愁爱上了陆展元', 7) as out_put;
select substr('李莫愁爱上了陆展元', 1, 3) as out_put;

-- 姓名中首字符大写，其他小写，拼接出来
select concat(upper(substr(last_name, 1, 1)), lower(substr(last_name, 2)))
from employees;

-- instr 返回索引位置
select instr('李莫愁爱上了陆展元', '陆展元') as out_put;

-- trim 去除前后字符，空为空格(from)
select trim('       张翠山          ') as out_put;
select trim('a' from 'aaaaaaaaa张aaaaa翠山aaaaaaaaa') as out_put;

-- lpad 用指定的字符实现左填充 (rpad右填充)
select lpad('殷素素', 10, '*') as out_put;

-- replace 替换
select replace('周大侠周大侠周花周周大侠', '周大侠', '周小侠');