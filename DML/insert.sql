
INSERT INTO 表名(列明, ...) 
values(值, ...), (...), ...

要求插入的值的类型与列的类型要一致;


INSERT INTO beauty(id, name, sex, borndate, phone, photo, boyfriend_id)
values(13, '唐艺昕', '女', '1990-4-23', '18388888888', null, 2);

---- 可以为null的列插入值的方法
insert into beauty(id, name, sex, borndate, phone, boyfriend_id)
values(14, '金星', '女', '1990-4-23', '18388887888', 9);

insert into beauty(id, name, sex, phone)
values(15, '火星', '男', '18439583028');

---- 可以省略列名，顺序必须一致
insert into beauty
values(16, '张飞', '男', null, '2389298528', null, null);

---- 子查询
insert into beauty(id, name, phone)
select 26, '宋茜', '231';

/*
方式2

INSERT INTO 表名
SET 列名 = 值， 列名 = 值， ...
*/

INSERT INTO beauty
SET id = 17, name = '关羽', sex = '男', borndate = null, phone = '123', photo = null, boyfriend_id = null;  