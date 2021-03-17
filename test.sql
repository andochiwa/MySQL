use test;
CREATE TABLE t1(id INT(10) AUTO_INCREMENT,content VARCHAR(100) NULL , PRIMARY KEY (id));
CREATE TABLE t2(id INT(10) AUTO_INCREMENT,content VARCHAR(100) NULL , PRIMARY KEY (id));
CREATE TABLE t3(id INT(10) AUTO_INCREMENT,content VARCHAR(100) NULL , PRIMARY KEY (id));
INSERT INTO t1(content) VALUES(CONCAT('t1_',FLOOR(1+RAND()*1000)));
INSERT INTO t2(content) VALUES(CONCAT('t2_',FLOOR(1+RAND()*1000)));
INSERT INTO t3(content) VALUES(CONCAT('t3_',FLOOR(1+RAND()*1000)));

alter table t1 add column col1 varchar(100);
alter table t1 add column col2 varchar(100);
alter table t1 add column col3 varchar(100);
alter table t2 add column col1 varchar(100);
alter table t2 add column col2 varchar(100);

INSERT INTO t1(col1) VALUES(CONCAT('col1_',FLOOR(1+RAND()*1000)));
INSERT INTO t1(col2) VALUES(CONCAT('col2_',FLOOR(1+RAND()*1000)));
INSERT INTO t1(col3) VALUES(CONCAT('col3_',FLOOR(1+RAND()*1000)));

INSERT INTO t2(col1) VALUES(CONCAT('col1_',FLOOR(1+RAND()*1000)));
INSERT INTO t2(col2) VALUES(CONCAT('col2_',FLOOR(1+RAND()*1000)));
-- 索引
create index idx_col1_col2 on t1(col1, col2);
-- 索引
create index idx_col1_col2_col3 on t1(col1, col2, col3);

-- using filesort
explain select col1
from t1
where col1 = 'ac'
order by col3;

-- using temporary
explain select col2
from t1
where col1 in ('ac', 'ab', 'aa')
group by col2;

------ 索引最適化部分
CREATE TABLE IF NOT EXISTS article(
`id` INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
`author_id` INT (10) UNSIGNED NOT NULL,
`category_id` INT(10) UNSIGNED NOT NULL , 
`views` INT(10) UNSIGNED NOT NULL , 
`comments` INT(10) UNSIGNED NOT NULL,
`title` VARBINARY(255) NOT NULL,
`content` TEXT NOT NULL
);
INSERT INTO `article`(`author_id`,`category_id` ,`views` ,`comments` ,`title` ,`content` )VALUES
(1,1,1,1,'1','1'),
(2,2,2,2,'2','2'),
(1,1,3,3,'3','3');
show index from article;

explain select views
from article
where category_id = 1 and comments > 1
order by views
limit 1;

-- like
explain select * from article
where title like 'a';

-- title
create index idx_title on article(title);

-- ccv
create index idx_ccv on article(category_id, comments, views); 
drop index idx_ccv on article;

-- cv
create index idx_cv on article(category_id, views);
drop index idx_cv on article;
show index from article;

explain select category_id, views from article
where views = 5 and category_id  = 5;


explain select *
from t1
left join t2
on t1.content = t2.content;

create index idx_t1_c on t1(content);
drop index idx_t1_c on t1;

create index idx_t2_c on t2(content);
drop index idx_t2_c on t2;
