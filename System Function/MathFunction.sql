-- round 四舍五入 (值，保留小数位)
SELECT round(1.567, 2);

-- ceil 向上取整 floor 向下取整
SELECT ceil(1.567), ceil(-1.02);
SELECT floor(-9.99);

-- truncate 截断
SELECT truncate(1.699999, 1);

-- mod取模 (a, b) a - a / b * b
SELECT mod(10, -3); # 1
SELECT mod(-10, -3); # -1