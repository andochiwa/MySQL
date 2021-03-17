
标识列（自增长列_
1、标识列不要求和主键搭配，但要求是个key
2、一个表只能有一个标识列
3、标识列只能是数值型
4、标识列可以设置步长, 手动设置起始值;


drop table if exists tab_identity;
truncate table tab_identity;
create table if not exists tab_identity(
    id int primary key auto_increment,
    name varchar(20)
);

insert into tab_identity
values(null, 'john');
-- 手动设置起始值
insert into tab_identity
values(5, 'john');

-- 设置步长
set auto_increment_increment = 1;
set auto_increment_offset = 1;

show variables like '%auto_increment%';
show index from tab_identity;
desc tab_identity;

select *
from tab_identity;

---- 修改表时设置标识列
alter table tab_identity modify column id int primary key auto_increment;

---- 修改表时删除标识列
alter table tab_identity modify column id int;