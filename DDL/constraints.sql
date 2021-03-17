
create table 表名 (
    字段名 字段类型 约束
)

分类：六大约束
    NOT NULL: 非空，保证该字段的值不能为空(姓名，学号等)
    DEFAULT: 保证该字段有默认值(性别等)
    PRIMARY KEY: 主键， 保证该字段的值具有唯一性， 并且非空(学号，员工编号等)
    UNIQUE: 唯一， 保证该字段的值具有唯一性，可以为空(座位号等)
    CHECK: 检查约束【mysql不支持】 
    FOREIGN KEY: 外键，限制两个表的关系， 用于保证该字段的值必须来自于主表关联列的值
        在从表添加外键约束，用于引用主表中某列的值
        比如学生表的专业编号，员工表的部门编号，工种编号

添加约束的时机：创建表时， 修改表时

约束的添加分类：
    列级约束
        六大约束都可以写，但外键约束没有效果
    表级约束
        除了NOT NULL和DEFAULT都支持

主键和唯一的对比：
    主键： 保证唯一性， 不允许为空， 只能有一个， 允许组合（不推荐）
    唯一： 保证唯一性， 允许为空，  可以有多个， 允许组合（不推荐）

外键：
    1、要求在从表设置外键关系
    2、从表的外键列的类型和主表的关联列的类型必须一致或兼容
    3、主表的关联列必须是一个key（一般是主键或唯一）
    4、插入数据时先插入主表再插入从表
    5、删除数据时应该先删除从表再删除主表;


---- 创建表时添加约束
-- 添加列级约束
create database students;

create table stuinfo(
    id int primary key,
    stuname varchar(20) not null,
    sex char(1), check(sex = '男' or sex = '女'),
    seat int unique,
    age int default 18,
    majorid int references major(id)
);
create table major (
    id int primary key,
    majorname varchar(20)
);
desc stuinfo;
show index from stuinfo;
drop table if exists stuinfo;

-- 添加表级约束
create table stuinfo(
    id int,
    stuname varchar(20),
    sex char(1),
    seat int,
    age int,
    majorid int,

    primary key(id),
    constraint uq unique(seat),
    constraint ck check(sex = '男' or sex = '女'),
    constraint fk_stuinfo_major foreign key(majorid) references major(id)
);

---- 通用写法
create table if not exists stuinfo (
    id int primary key,
    stuname varchar(20) not null,
    sex char(1),
    age int default 18,
    seat int unique,
    majorid int,
    constraint fk_stuinfor_major foreign key(majorid) references major(id)
);

---- 修改表时添加约束
drop table if exists stuinfo;
create table stuinfo(
    id int,
    stuname varchar(20),
    sex char(1),
    seat int,
    age int,
    majorid int
);
desc stuinfo;
-- 添加非空约束
alter table stuinfo modify column stuname varchar(20) not null;
-- 添加默认约束
alter table stuinfo modify column age int default 18;
-- 添加主键
alter table stuinfo modify column id int primary key;
-- 添加唯一键
alter table stuinfo modify column seat int unique;
-- 添加外键
alter table stuinfo add constraint fk_stuinfor_major foreign key(majorid) references major(id);

---- 修改表时删除约束
-- 删除非空约束
alter table stuinfo modify column stuname varchar(20) null;
-- 删除默认约束
alter table stuinfo modify column age int;
-- 删除主键
alter table stuinfo modify column id;
alter table stuinfo drop primary key;
-- 删除唯一
alter table stuinfo drop index seat;
-- 删除外键
alter table stuinfo drop foreign key fk_stuinfor_major;
-- 级联删除
alter table stuinfo add constraint fk_stuinfor_major foreign key(majorid) references major(id) on delete cascade;
-- 级联置空
alter table stuinfo add constraint fk_stuinfor_major foreign key(majorid) references major(id) on delete set null;
show index from stuinfo;
desc stuinfo;
