---- 表的创建
CREATE TABLE 表名 (
    列名 列的类型 【(长度) 约束】，
    列名 列的类型 【(长度) 约束】，
    列名 列的类型 【(长度) 约束】，
    ...
    列名 列的类型 【(长度) 约束】，
);

-- 创建表book
CREATE TABLE if NOT EXISTS book (
    id int,
    bName varchar(20),
    price double,
    authorid int,
    publishDate datetime
);
CREATE TABLE if NOT EXISTS author (
    id int,
    au_name varchar(20),
    nation varchar(10)
);

---- 表的修改
-- 修改列名
ALTER TABLE book change column publishDate pubDate datetime; --(column可以省略)
--修改列的类型或约束
ALTER TABLE book modify column pubdate timestamp;
--添加列
ALTER TABLE author ADD column annual double;
--删除列
ALTER TABLE author DROP column annual;
--修改表名
ALTER TABLE author rename to book_author;

---- 表的删除
DROP TABLE if EXISTS book_author;

---- 表的复制
INSERT INTO author VALUES
(1, '村上春树', '日本'),
(2, '莫言', '中国'),
(3, '冯唐', '中国'),
(4, '金庸', '中国');

-- 仅复制表的结构
create table copy1 like author;
drop table if exists copy;

-- 复制表的结构+数据
create table if not exists copy2
select * from author;

-- 只复制部分结构+数据
create table copy3
select id, au_name
from author;

-- 仅复制部分结构
create table if not exists copy4
select id, au_name
from author
where 0;