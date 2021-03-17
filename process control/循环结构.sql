分类：
while, loop, repeat
循环控制:
iterate 类似于 continue, 继续
leave 类型与 break, 跳出

while语法
[标签] while 循环条件 do
    循环体；
end while[标签]；

loop语法
[标签] loop
    循环体；
end loop [标签]；
（死循环）

repeat语法
[标签] repeat
    循环体；
until 结束循环的条件
end repeat [标签];

-- 根据设置的次数插入到admin中多条记录
delimiter $
create procedure pro_while1(in insertCount int)
begin
    declare i int default 1;
    while i <= insertCount do
        insert into admin(username, password)
        values(concat('rose', i), '6666');
        set i = i + 1;
    end while;
end $
call pro_while1(100)$

---- 添加leave语句
-- 根据次数插入到admin多条记录，如果次数>20则停止
truncate table admin$
drop procedure if exists pro_while2$
create procedure pro_while2(in insertCount int)
begin 
    declare i int default 1;
    a:while i <= insertCount do
        insert into admin(username, password)
        values(concat('mary', i), 0000);
        if i >= 20 then leave a;
        end if;
        set i = i + 1;
    end while a;
end $
call pro_while2(100)$
show variables like 'character%