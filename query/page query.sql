
当要显示的数据一页显示不全时，需要分页提交sql请求
语法
    select 查询列表
    from 表
    [join type]
    on 连接条件
    where 筛选条件
    group by 分组字段
    having 分组后的筛选
    order by 排序字段
    limit offset, size

    offset: 要显示条目的起始索引， 从0开始
    size: 要显示的条目个数
    offset: (page - 1) * size;


-- 查询前五条员工信息
select *
from employees
limit 0, 5;

-- 查询11-25条
select *
from employees
limit 10, 15;

-- 有奖金的员工信息，并显示工资较高的前十名
select *
from employees
where commission_pct is not null
order by salary desc
limit 0, 10;