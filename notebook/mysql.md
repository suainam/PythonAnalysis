#Hello.World
show databases;
use mysql;
CREATE TABLE students
(sno VARCHAR(3) NOT NULL, 
sname VARCHAR(4) NOT NULL,
ssex VARCHAR(2) NOT NULL, 
sbirthday DATETIME,
class VARCHAR(5));

CREATE TABLE courses
(cno VARCHAR(5) NOT NULL, 
cname VARCHAR(10) NOT NULL, 
tno VARCHAR(10) NOT NULL);

CREATE TABLE scores 
(sno VARCHAR(3) NOT NULL, 
cno VARCHAR(5) NOT NULL, 
degree NUMERIC(10, 1) NOT NULL); 

CREATE TABLE teachers 
(tno VARCHAR(3) NOT NULL, 
tname VARCHAR(4) NOT NULL, tsex VARCHAR(2) NOT NULL, 
tbirthday DATETIME NOT NULL, prof VARCHAR(6), 
depart VARCHAR(10) NOT NULL);

INSERT INTO STUDENTS (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (108 ,'曾华' ,'男' ,'1977-09-01',95033);
INSERT INTO STUDENTS (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (105 ,'匡明' ,'男' ,'1975-10-02',95031);
INSERT INTO STUDENTS (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (107 ,'王丽' ,'女' ,'1976-01-23',95033);
INSERT INTO STUDENTS (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (101 ,'李军' ,'男' ,'1976-02-20',95033);
INSERT INTO STUDENTS (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (109 ,'王芳' ,'女' ,'1975-02-10',95031);
INSERT INTO STUDENTS (SNO,SNAME,SSEX,SBIRTHDAY,CLASS) VALUES (103 ,'陆君' ,'男' ,'1974-06-03',95031);

INSERT INTO COURSES(CNO,CNAME,TNO)VALUES ('3-105' ,'计算机导论',825);
INSERT INTO COURSES(CNO,CNAME,TNO)VALUES ('3-245' ,'操作系统' ,804);
INSERT INTO COURSES(CNO,CNAME,TNO)VALUES ('6-166' ,'数据电路' ,856);
INSERT INTO COURSES(CNO,CNAME,TNO)VALUES ('9-888' ,'高等数学' ,100);

INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (103,'3-245',86);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (105,'3-245',75);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (109,'3-245',68);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (103,'3-105',92);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (105,'3-105',88);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (109,'3-105',76);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (101,'3-105',64);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (107,'3-105',91);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (108,'3-105',78);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (101,'6-166',85);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (107,'6-106',79);
INSERT INTO SCORES(SNO,CNO,DEGREE)VALUES (108,'6-166',81);

INSERT INTO TEACHERS(TNO,TNAME,TSEX,TBIRTHDAY,PROF,DEPART) VALUES (804,'李诚','男','1958-12-02','副教授','计算机系');
INSERT INTO TEACHERS(TNO,TNAME,TSEX,TBIRTHDAY,PROF,DEPART) VALUES (856,'张旭','男','1969-03-12','讲师','电子工程系');
INSERT INTO TEACHERS(TNO,TNAME,TSEX,TBIRTHDAY,PROF,DEPART) VALUES (825,'王萍','女','1972-05-05','助教','计算机系');
INSERT INTO TEACHERS(TNO,TNAME,TSEX,TBIRTHDAY,PROF,DEPART) VALUES (831,'刘冰','女','1977-08-14','助教','电子工程系');

#查询Student表中的所有记录的Sname、Ssex和Class列。
select * from Student;
# 查询教师所有的单位即不重复的Depart列。
select distinct(Depart) from teachers;
# 查询Score表中成绩在60到80之间的所有记录。
select * from scores where degree between 60 and 80;
select * from scores where degree in (85, 86, 88);
select * from students where ssex='女' or class = 95031;
select * from students order by class desc;
select * from scores order by cno, degree desc;
select count(*) from students where class = '95031';
select count(1) as stunum from students where class = '95031';
select sno, degree from scores order by degree desc limit 1;
# 查询Score表中至少有5名学生选修的并以3开头的课程的平均分数
select * from scores limit 2;
select avg(degree) from scores where cno like '3%' group by cno having count(sno) >= 5;
select cno, avg(degree) from scores where cno like '3%' group by cno having count(sno) >= 5;
# 查询最低分大于70，最高分小于90的Sno列
select sno from scores where max(degree) > 70 and min(degree) < 90;