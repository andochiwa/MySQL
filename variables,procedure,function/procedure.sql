
含义：一组预先编译好的sql语句的集合，理解成批处理语句
1、提高代码的重用性
2、简化操作
3、减少编译次数并且减少和数据库服务器的连接次数，提高了效率

---- 创建语法
 create procedure 存储过程名(参数列表)
    begin
        存储过程体(一组合法的sql语句)
    end

注意：
1、参数列表包含三部分
参数模式 参数名 参数类型
in stuname varchar(20)

参数模式
in: 该参数可以作为输入，也就是该参数需要传参
out: 该参数可以作为输出，也就是该参数可以作为返回值
inout: 既需要传参，又可以返回值

2、如果存储过程只有一句话，可以省略begin和end
存储过程提中的每条sql语句要求必须加分号
存储过程的结尾可以使用delimiter重新设置
语法：
delimiter 结束标记
例
delimiter $

二、调用语法
call 存储过程名(实参列表);

-- 插入到admin表中五条记录
delimiter $
create procedure myp1()
begin
    insert into admin(username, password)
    values('john1', '0000'), ('lily', '0000'), ('rose', '0000'), ('jack', '0000'), ('tom', '0000');
end $
-- 调用
call myp1()$

---- 创建带in模式参数的存储过程
-- 创建存储过程 实现根据女神名，查询对应的男神信息
create procedure myp2(in beautyname varchar(20))
begin
    select b.*
    from boys b
    right join beauty g
    on b.id = g.boyfriend_id
    where g.name = 'beautyname'; 
end $

--调用
set name gbk$
call myp2('小昭')$

drop database girls

-- 创建存储过程实现用户是否登录成功
create procedure myp4(in username varchar(20), in password varchar(20))
begin
    declare result int default 0;
    select count(*) into result
    from admin a
    where a.username = username
    and a.password = password;
    select result;
end $
call myp4('john','8888')$

---- 带out模式的存储过程
-- 根据女神名，返回对应的男神名
create procedure myp5(in beautyname varchar(20), out boyname varchar(20))
begin
    select b.boyname into boyname
    from boys b
    join beauty g
    on b.id = g.boyfriend_id
    where g.name = beautyname;
end $

call myp5('小昭', @bname)$
select @bname$

-- 创建带inout模式的
-- 传入a和b两个值，翻倍后返回
create procedure myp6(inout a int, inout b int)
begin
    set a = a * 2;
    set b = b * 2;
end $

set @m = 10$
set @n = 20$
call myp6(@m, @n)$
select @m, @n$

---- 删除存储过程
drop procedure myp6
---- 查看存储过程
show create procedure myp1