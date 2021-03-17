
1. DELETE
单表删除
DELETE FROM 表名
WHERE 筛选条件

多表删除
DELETE 表1的别名, 表2的别名
FROM 表1 别名, 表2 别名
inner|left|right JOIN 表2 别名 ON 连接条件
WHERE 筛选条件

2. truncate
truncate TABLE 表名

如果删除的表中有自增长列
如果用delete删除后，再插入数据，自增长列的值从断点开始
而用truncate删除后，再插入数据，自增长列的值从1开;

---- 单表删除
-- 删除手机号以9结尾的女神的信息
DELETE FROM beauty
WHERE phone LIKE '%9';

---- 多表删除
-- 删除张无忌的女朋友的信息
DELETE g
FROM beauty g
JOIN boys b
ON g.boyfriend_id = b.id
WHERE b.boyName = '张无忌';


---- truncate
truncate TABLE boys;