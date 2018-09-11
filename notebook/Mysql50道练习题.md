#### �������ݼ�
```sql
create table Student(SID varchar(10),Sname nvarchar(10),Sage datetime,Ssex nvarchar(10));
insert into Student values('01' , '����' , '1990-01-01' , '��');
insert into Student values('02' , 'Ǯ��' , '1990-12-21' , '��');
insert into Student values('03' , '���' , '1990-05-20' , '��');
insert into Student values('04' , '����' , '1990-08-06' , '��');
insert into Student values('05' , '��÷' , '1991-12-01' , 'Ů');
insert into Student values('06' , '����' , '1992-03-01' , 'Ů');
insert into Student values('07' , '֣��' , '1989-07-01' , 'Ů');
insert into Student values('08' , '����' , '1990-01-20' , 'Ů');

create table Course(CID varchar(10),Cname nvarchar(10),TID varchar(10));
insert into Course values('01' , '����' , '02');
insert into Course values('02' , '��ѧ' , '01');
insert into Course values('03' , 'Ӣ��' , '03');

create table Teacher(TID varchar(10),Tname nvarchar(10));
insert into Teacher values('01' , '����');
insert into Teacher values('02' , '����');
insert into Teacher values('03' , '����');

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
01|����|02
02|��ѧ|01
03|Ӣ��|03
> student

SID|Sname|Sage|Ssex
---|---|---|---
01|����|1990-01-01|��
02|Ǯ��|1990-21-21|��
03|���|1990-05-20|��
04|����|1990-08-06|��
05|��÷|1991-12-01|Ů
06|����|1992-03-01|Ů
07|֣��|1989-07-01|Ů
08|����|1990-01-20|Ů
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
01|����
02|����
03|����

1. ��ѯ"01"�γ̱�"02"�γ̳ɼ��ߵ�ѧ������Ϣ���γ̷���
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
    02|Ǯ��|1990-12-21|��|70|60
    04|����|1990-08-06|��|50|30
    
    - ��ѯͬʱ����"01"�γ̺�"02"�γ̵����
    ```sql
    select * 
    from Student a, sc b, sc c
    where a.SID = b.SID and a.SID = c.SID
    and b.CID = '01' and c.CID = '02';
    ```
    SID|Sname|Sage|Ssex|SID|CID|score|SID|CID|score
    ---|---|---|---|---|---|---|---|---|---
    01|����|1990-01-01|��|01|01|80|01|02|90
    02|Ǯ��|1990-12-21|��|02|01|70|02|02|60
    03|���|1990-05-20|��|03|01|80|03|02|80
    04|����|1990-08-06|��|04|01|50|04|02|30
    05|��÷|1991-12-01|��|05|01|76|05|02|87
    
    - ��ѯ����"01"�γ̵����ܲ�����"02"�γ̵����(������ʱ��ʾΪnull)(���´�����ͬ����ʱ���ٽ���)
    ```sql
    select a.*, r.course1, r.course2 
    from Student a right join
    (select t1.SID, t1.CID course1, t2.CID course2 
    from (select SID, CID from sc where CID = '01') t1 left join
    (select SID, CID from sc where CID = '02') t2
    on t2.SID = t1.SID) r
    on a.SID = r.SID;
    ```
    eg.*����ֻ������ʽ�������г���ϸ����*
    SID|01|02|03|04|05|06
    ---|---|---|---|---|---|---
    - ��ѯ������"01"�γ̵�����"02"�γ̵����
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
2. ��ѯƽ���ɼ����ڵ��� 60 �ֵ�ͬѧ��ѧ����ź�ѧ��������ƽ���ɼ�
```sql
select a.SID, a.Sname, r.avgs
from Student a right join 
(select SID, avg(score) avgs from sc group by SID having avg(score) >= 60) r
on a.SID = r.SID;
```
**ע��Ҫ��avg(score)����alias,������**
SID|01|02|03|05|07
---|---|---|---|---|---
3. ��ѯ�� SC ����ڳɼ���ѧ����Ϣ
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
4. ��ѯ����ͬѧ��ѧ����š�ѧ��������ѡ�����������пγ̵��ܳɼ�(û�ɼ�����ʾΪ null )
```sql
select a.*, r.cd, r.ss
from student a left join
(select SID, count(CID) cd, sum(score) ss from sc group by SID) r 
on a.SID = r.SID;
```
SID|01|02|03|04|05|06|07|08
-|-|-|-|-|-|-|-|-
- ���гɼ���ѧ����Ϣ
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
[��ѯ��exists��in������](https://www.jianshu.com/p/f212527d76ff)

**EXISTS���ڼ���Ӳ�ѯ�Ƿ����ٻ᷵��һ�����ݣ����Ӳ�ѯʵ���ϲ��������κ����ݣ����Ƿ���ֵTrue��False**

���ۣ�
- **IN()�ʺ�B���A������С�����**
- **EXISTS()�ʺ�B���A�����ݴ�����**

SID|01|02|03|04|05|06|07
---|---|---|---|---|---|---|---

5. ��ѯ�������ʦ������
```sql
select count(Tname)
from teacher
where Tname like '��%';
```
answer: *2*
6. ��ѯѧ������������ʦ�ڿε�ͬѧ����Ϣ
```sql
select a.*
from student a,teacher t,course c,sc
where t.Tname = '����' and t.TID = c.TID and c.CID = sc.CID and sc.SID = a.SID;
```
SID|01|02|03|04|05|06|07
-|-|-|-|-|-|-|-
7. ��ѯû��ѧȫ���пγ̵�ͬѧ����Ϣ
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
8. ��ѯ������һ�ſ���ѧ��Ϊ" 01 "��ͬѧ��ѧ��ͬ��ͬѧ����Ϣ
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
9. ��ѯ��" 01 "�ŵ�ͬѧѧϰ�Ŀγ� ��ȫ��ͬ������ͬѧ����Ϣ
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
10. ��ѯûѧ��"����"��ʦ���ڵ���һ�ſγ̵�ѧ������


��ѯ���ż������ϲ�����γ̵�ͬѧ��ѧ�ţ���������ƽ���ɼ�

����" 01 "�γ̷���С�� 60���������������е�ѧ����Ϣ

��ƽ���ɼ��Ӹߵ�����ʾ����ѧ�������пγ̵ĳɼ��Լ�ƽ���ɼ�

��ѯ���Ƴɼ���߷֡���ͷֺ�ƽ���֣�

��������ʽ��ʾ���γ� ID���γ� name����߷֣���ͷ֣�ƽ���֣������ʣ��е��ʣ������ʣ�������

����Ϊ>=60���е�Ϊ��70-80������Ϊ��80-90������Ϊ��>=90

Ҫ������γ̺ź�ѡ����������ѯ����������������У���������ͬ�����γ̺���������

�����Ƴɼ��������򣬲���ʾ������ Score �ظ�ʱ�������ο�ȱ
15.1 �����Ƴɼ��������򣬲���ʾ������ Score �ظ�ʱ�ϲ�����

��ѯѧ�����ܳɼ����������������ܷ��ظ�ʱ�������ο�ȱ
16.1 ��ѯѧ�����ܳɼ����������������ܷ��ظ�ʱ���������ο�ȱ

ͳ�Ƹ��Ƴɼ����������������γ̱�ţ��γ����ƣ�[100-85]��[85-70]��[70-60]��[60-0] ����ռ�ٷֱ�

��ѯ���Ƴɼ�ǰ�����ļ�¼

��ѯÿ�ſγ̱�ѡ�޵�ѧ����

��ѯ��ֻѡ�����ſγ̵�ѧ��ѧ�ź�����

��ѯ������Ů������

��ѯ�����к��С��硹�ֵ�ѧ����Ϣ

��ѯͬ��ͬ��ѧ����������ͳ��ͬ������

��ѯ 1990 �������ѧ������

��ѯÿ�ſγ̵�ƽ���ɼ��������ƽ���ɼ��������У�ƽ���ɼ���ͬʱ�����γ̱����������

��ѯƽ���ɼ����ڵ��� 85 ������ѧ����ѧ�š�������ƽ���ɼ�

��ѯ�γ�����Ϊ����ѧ�����ҷ������� 60 ��ѧ�������ͷ���

��ѯ����ѧ���Ŀγ̼��������������ѧ��û�ɼ���ûѡ�ε������

��ѯ�κ�һ�ſγ̳ɼ��� 70 �����ϵ��������γ����ƺͷ���

��ѯ������Ŀγ�

��ѯ�γ̱��Ϊ 01 �ҿγ̳ɼ��� 80 �����ϵ�ѧ����ѧ�ź�����

��ÿ�ſγ̵�ѧ������

�ɼ����ظ�����ѯѡ�ޡ���������ʦ���ڿγ̵�ѧ���У��ɼ���ߵ�ѧ����Ϣ����ɼ�

�ɼ����ظ�������£���ѯѡ�ޡ���������ʦ���ڿγ̵�ѧ���У��ɼ���ߵ�ѧ����Ϣ����ɼ�

��ѯ��ͬ�γ̳ɼ���ͬ��ѧ����ѧ����š��γ̱�š�ѧ���ɼ�

��ѯÿ�Ź��ɼ���õ�ǰ����

ͳ��ÿ�ſγ̵�ѧ��ѡ������������ 5 �˵Ŀγ̲�ͳ�ƣ���

��������ѡ�����ſγ̵�ѧ��ѧ��

��ѯѡ����ȫ���γ̵�ѧ����Ϣ

��ѯ��ѧ�������䣬ֻ���������

���ճ����������㣬��ǰ���� < �������µ������������һ

��ѯ���ܹ����յ�ѧ��

��ѯ���ܹ����յ�ѧ��

��ѯ���¹����յ�ѧ��

��ѯ���¹����յ�ѧ��

