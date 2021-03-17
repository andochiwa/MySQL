
1. 修改单标的记录
UPDATE 表明
SET 列 = 值, 列 = 值, ...
WHERE 筛选条件

2. 修改多表的记录;


---- 修改beauty中关羽的电话为321
UPDATE beauty
SET phone = 321
WHERE name = '关羽';

UPDATE boys
SET boyName = '张飞', userCP = 1000
where id = 2;

---- 修改多表的记录
-- 修改张无忌的女朋友的手机号为114
update boys b
join beauty g
on b.id = g.boyfriend_id
set g.phone = 114
where b.boyName = '张无忌';

-- 修改没有男朋友的女神的男朋友编号都为张飞
UPDATE boys b
RIGHT JOIN beauty g
ON b.id = g.boyfriend_id
SET g.boyfriend_id = 2
WHERE b.id IS NULL;