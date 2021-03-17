
1、原子性
    要么全都发生，要么都不发生
2、一致性
    必须事数据库从一个一致性状态变换到另一个一致性状态
3、隔离性(有隔离级别)
    不能被其他事务所干扰
4、持久性
    事务一旦提交，对数据库的改变就是永久的

事务的创建
隐式事务：事务没有明显的开启和结束的标记
比如insert, update, delete语句

显示事务：事务具有明显的开始和结束的标记
前提：必须先设置自动提交功能为禁用
步骤1：开启事务
    set autocommit = 0
    start transaction (可选)
步骤2：编写事务中的sql语句(select insert update delete)
    语句1
    语句2
步骤3：结束事务
    commit 提交事务
    rollback 回滚事务

savepoint 节点名：设置保存点;


-- 开启事务
set autocommit = 0;
start transaction;
-- 编写一组事务
update admin
set password = 7777
where username = 'john';
update admin
set password = 6654
where username = 'lyt';
-- 结束事务
rollback;

---- delete和truncate在事务使用时的区别
-- delete
set autocommit = 0;
start transaction;
delete from admin;
rollback;

-- truncate
set autocommit = 0;
start transaction;
truncate table admin;
rollback;

-- savepoint
set autocommit = 0;
delete from beauty
where id = 1;
savepoint a; -- 设置保存点
delete from beauty
where id = 2;
rollback to a; -- 回滚到保存点