---- 视图的更新
create or replace view v2 as
select last_name, email, salary * 12 * (1 + ifnull(commission_pct, 0)) "annual salary"
from employees;

create or replace view v2 as
select last_name, email
from employees;

select * from v2;
-- 插入
insert into v2 values('张飞', 'zf@qq.com');

-- 修改
update v2
set last_name = '张无忌'
where last_name = '张飞';

-- 删除
delete from v2
where last_name = '张无忌';
