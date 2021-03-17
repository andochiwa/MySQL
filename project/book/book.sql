DROP DATABASE IF EXISTS book;

CREATE DATABASE book;

USE book;

drop table if exists t_user;
CREATE TABLE t_user(
    id int PRIMARY KEY AUTO_INCREMENT,
    username varchar(20) NOT NULL UNIQUE,
    `PASSWORD` varchar(32) NOT NULL,
    email varchar(200)
);

INSERT INTO
    t_user(username, PASSWORD, email)
VALUES
('admin', 'admin', 'admin@me.com');
select * from t_user;