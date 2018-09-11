#### 创建数据集
```sql
create table Student(SID varchar(10),Sname nvarchar(10),Sage datetime,Ssex nvarchar(10));
insert into Student values('01' , '赵雷' , '1990-01-01' , '男');
insert into Student values('02' , '钱电' , '1990-12-21' , '男');
insert into Student values('03' , '孙风' , '1990-05-20' , '男');
insert into Student values('04' , '李云' , '1990-08-06' , '男');
insert into Student values('05' , '周梅' , '1991-12-01' , '女');
insert into Student values('06' , '吴兰' , '1992-03-01' , '女');
insert into Student values('07' , '郑竹' , '1989-07-01' , '女');
insert into Student values('08' , '王菊' , '1990-01-20' , '女');

create table Course(CID varchar(10),Cname nvarchar(10),TID varchar(10));
insert into Course values('01' , '语文' , '02');
insert into Course values('02' , '数学' , '01');
insert into Course values('03' , '英语' , '03');

create table Teacher(TID varchar(10),Tname nvarchar(10));
insert into Teacher values('01' , '张三');
insert into Teacher values('02' , '李四');
insert into Teacher values('03' , '王五');

create table SC(SID varchar(10),CID varchar(10),score decimal(18,1));
insert into SC values('01' , '01' , 80);
insert into SC values('01' , '02' , 90);
insert into SC values('01' , '03' , 99);
insert into SC values('02' , '01' , 70);
insert into SC values('02' , '02' , 60);
insert into SC values('02' , '03' , 80);
insert into SC values('03' , '01' , 80);
insert into SC values('03' , '02' , 80);
insert into SC values('03' , '03' , 80);
insert into SC values('04' , '01' , 50);
insert into SC values('04' , '02' , 30);
insert into SC values('04' , '03' , 20);
insert into SC values('05' , '01' , 76);
insert into SC values('05' , '02' , 87);
insert into SC values('06' , '01' , 31);
insert into SC values('06' , '03' , 34);
insert into SC values('07' , '02' , 89);
insert into SC values('07' , '03' , 98);
```
> course

CID|Cname|TID
---|---|---
01|语文|02
02|数学|01
03|英语|03
> student

SID|Sname|Sage|Ssex
---|---|---|---
01|赵雷|1990-01-01|男
02|钱电|1990-21-21|男
03|孙风|1990-05-20|男
04|李云|1990-08-06|男
05|周梅|1991-12-01|女
06|吴兰|1992-03-01|女
07|郑竹|1989-07-01|女
08|王菊|1990-01-20|女
>sc

SID|CID|score
---|---|---
01|01|80
01|02|90
01|03|99
02|01|70
02|02|60
02|03|80
03|01|80
03|02|80
03|03|80
04|01|50
04|02|30
04|03|20
05|01|76
05|02|87
06|01|31
06|03|34
07|02|89
07|03|98
> teacher

TID|Tname
---|---
01|张三
02|李四
03|王五

1. 查询"01"课程比"02"课程成绩高的学生的信息及课程分数
    ```sql
    # 1st
    select a.*, b.score course1, c.score course2 from Student a, SC b, SC c
    where a.SID = b.SID and a.SID = c.SID and 
    b.CID = '01' and c.CID = '02' and b.score > c.score;
    
    # 2nd
    select * from Student a right join
    (select t1.SID, t1.score as course1, t2.score as course2 from
    (select SID, score from sc where CID = '01') t1,
    (select SID, score from sc where CID = '02') t2
    where t1.SID = t2.SID and t1.score > t2.score) r
    on a.SID = r.SID;
    ```
    SID|Sname|Sage|Ssex|course1|course2
    ---|---|---|---|---|---
    02|钱电|1990-12-21|男|70|60
    04|李云|1990-08-06|男|50|30
    
    - 查询同时存在"01"课程和"02"课程的情况
    ```sql
    select * 
    from Student a, sc b, sc c
    where a.SID = b.SID and a.SID = c.SID
    and b.CID = '01' and c.CID = '02';
    ```
    SID|Sname|Sage|Ssex|SID|CID|score|SID|CID|score
    ---|---|---|---|---|---|---|---|---|---
    01|赵雷|1990-01-01|男|01|01|80|01|02|90
    02|钱电|1990-12-21|男|02|01|70|02|02|60
    03|孙风|1990-05-20|男|03|01|80|03|02|80
    04|李云|1990-08-06|男|04|01|50|04|02|30
    05|周梅|1991-12-01|男|05|01|76|05|02|87
    
    - 查询存在"01"课程但可能不存在"02"课程的情况(不存在时显示为null)(以下存在相同内容时不再解释)
    ```sql
    select a.*, r.course1, r.course2 
    from Student a right join
    (select t1.SID, t1.CID course1, t2.CID course2 
    from (select SID, CID from sc where CID = '01') t1 left join
    (select SID, CID from sc where CID = '02') t2
    on t2.SID = t1.SID) r
    on a.SID = r.SID;
    ```
    eg.*以下只给出样式，不在列出详细内容*
    SID|01|02|03|04|05|06
    ---|---|---|---|---|---|---
    - 查询不存在"01"课程但存在"02"课程的情况
    ```sql
    select a.*, r.CID, r.score 
    from Student a right join
    (select * from sc 
    where SID not in (select SID from sc where CID = '01')
    and CID = '02') r
    on a.SID = r.SID;
    ```
    SID|07|
    ---|---|
2. 查询平均成绩大于等于 60 分的同学的学生编号和学生姓名和平均成绩
```sql
select a.SID, a.Sname, r.avgs
from Student a right join 
(select SID, avg(score) avgs from sc group by SID having avg(score) >= 60) r
on a.SID = r.SID;
```
**注意要对avg(score)进行alias,重命名**
SID|01|02|03|05|07
---|---|---|---|---|---
3. 查询在 SC 表存在成绩的学生信息
```sql
# 1st
select a.*
from Student a
where a.SID in (select distinct SID from sc);
# 2nd
select distinct a.*
from student a, sc 
where a.sid = sc.sid;
```
4. 查询所有同学的学生编号、学生姓名、选课总数、所有课程的总成绩(没成绩的显示为 null )
```sql
select a.*, r.cd, r.ss
from student a left join
(select SID, count(CID) cd, sum(score) ss from sc group by SID) r 
on a.SID = r.SID;
```
SID|01|02|03|04|05|06|07|08
-|-|-|-|-|-|-|-|-
- 查有成绩的学生信息
```sql
# 1st
select a.*, r.cd, r.ss
from student a right join
(select SID, count(CID) cd, sum(score) ss from sc group by SID) r 
on a.SID = r.SID;
# 2nd
select a.*
from student a 
where exists (select sid from sc where sc.sid = a.sid);
# 3rd
select a.*
from student a
where sid in (select sid from sc);
```
[查询中exists和in的区别](https://www.jianshu.com/p/f212527d76ff)

**EXISTS用于检查子查询是否至少会返回一行数据，该子查询实际上并不返回任何数据，而是返回值True或False**

结论：
- **IN()适合B表比A表数据小的情况**
- **EXISTS()适合B表比A表数据大的情况**

SID|01|02|03|04|05|06|07
---|---|---|---|---|---|---|---

5. 查询「李」姓老师的数量
```sql
select count(Tname)
from teacher
where Tname like '李%';
```
answer: *2*
6. 查询学过「张三」老师授课的同学的信息
```sql
select a.*
from student a,teacher t,course c,sc
where t.Tname = '张三' and t.TID = c.TID and c.CID = sc.CID and sc.SID = a.SID;
```
SID|01|02|03|04|05|06|07
-|-|-|-|-|-|-|-
7. 查询没有学全所有课程的同学的信息
```sql
# 1st
select a.* 
from student a
where sid not in (
select sid from sc 
group by sid
having count(cid) = (select count(cid) from course));
# 2nd
```
SID|05|06|07|08
-|-|-|-|-
8. 查询至少有一门课与学号为" 01 "的同学所学相同的同学的信息
```sql
# 1st
select student.* from 
student join (
select distinct sid from sc
where cid in (
select cid from sc
where sc.sid = '01'))r
on student.sid = r.sid
and student.sid <> '01';
```
SID|01|02|03|04|05|06|07
-|-|-|-|-|-|-|-
9. 查询和" 01 "号的同学学习的课程 完全相同的其他同学的信息
```sql
select a.* from student a
where a.sid <> '01' and
a.sid in
(select sid from sc group by sid
having count(cid) = 
(select count(cid) from sc where sid = '01' group by sid));
```
SID|02|03|04
-|-|-|-
10. 查询没学过"张三"老师讲授的任一门课程的学生姓名


查询两门及其以上不及格课程的同学的学号，姓名及其平均成绩

检索" 01 "课程分数小于 60，按分数降序排列的学生信息

按平均成绩从高到低显示所有学生的所有课程的成绩以及平均成绩

查询各科成绩最高分、最低分和平均分：

以如下形式显示：课程 ID，课程 name，最高分，最低分，平均分，及格率，中等率，优良率，优秀率

及格为>=60，中等为：70-80，优良为：80-90，优秀为：>=90

要求输出课程号和选修人数，查询结果按人数降序排列，若人数相同，按课程号升序排列

按各科成绩进行排序，并显示排名， Score 重复时保留名次空缺
15.1 按各科成绩进行排序，并显示排名， Score 重复时合并名次

查询学生的总成绩，并进行排名，总分重复时保留名次空缺
16.1 查询学生的总成绩，并进行排名，总分重复时不保留名次空缺

统计各科成绩各分数段人数：课程编号，课程名称，[100-85]，[85-70]，[70-60]，[60-0] 及所占百分比

查询各科成绩前三名的记录

查询每门课程被选修的学生数

查询出只选修两门课程的学生学号和姓名

查询男生、女生人数

查询名字中含有「风」字的学生信息

查询同名同性学生名单，并统计同名人数

查询 1990 年出生的学生名单

查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列

查询平均成绩大于等于 85 的所有学生的学号、姓名和平均成绩

查询课程名称为「数学」，且分数低于 60 的学生姓名和分数

查询所有学生的课程及分数情况（存在学生没成绩，没选课的情况）

查询任何一门课程成绩在 70 分以上的姓名、课程名称和分数

查询不及格的课程

查询课程编号为 01 且课程成绩在 80 分以上的学生的学号和姓名

求每门课程的学生人数

成绩不重复，查询选修「张三」老师所授课程的学生中，成绩最高的学生信息及其成绩

成绩有重复的情况下，查询选修「张三」老师所授课程的学生中，成绩最高的学生信息及其成绩

查询不同课程成绩相同的学生的学生编号、课程编号、学生成绩

查询每门功成绩最好的前两名

统计每门课程的学生选修人数（超过 5 人的课程才统计）。

检索至少选修两门课程的学生学号

查询选修了全部课程的学生信息

查询各学生的年龄，只按年份来算

按照出生日期来算，当前月日 < 出生年月的月日则，年龄减一

查询本周过生日的学生

查询下周过生日的学生

查询本月过生日的学生

查询下月过生日的学生

