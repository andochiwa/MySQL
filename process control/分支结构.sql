if结构， 实现多重分支
语法:
if 条件1 then 语句1；
else if 条件2 then 语句2；
...
else 语句n；
end if
应用在begin and中;

-- 根据传入的成绩返回他的级别
delimiter $
create function test_if(score int) returns char
begin
    if score >= 90 and score <= 100 then return 'A';
    elseif score >= 80 then return 'B';
    elseif score >= 60 then return 'C';
    else return 'D';
    end if;
end $

select test_if(86)$