#### ��Ҫ��ʰ��
> ִ��˳��
```sql
(8)SELECT (9)DISTINCT  (11)<Top Num> <select list>
(1)FROM [left_table]
(3)<join_type> JOIN <right_table>
(2)        ON <join_condition>
(4)WHERE <where_condition>
(5)GROUP BY <group_by_list>
(6)WITH <CUBE | RollUP>
(7)HAVING <having_condition>
(10)ORDER BY <order_by_list> 
```

- ʹ��concat��������ͬ�� ��ֵ
![name��capital��ͬ�ļ�¼.png](https://upload-images.jianshu.io/upload_images/11304499-9c4b29c8c6676026.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name from world
where name like concat(capital);
```
- ʹ��concat��ƥ����� ��ֵ��ע��ո�
![ʹ��concatע��ո�.png](https://upload-images.jianshu.io/upload_images/11304499-2d746126ef0f68f6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name from world 
where capital like concat(name, ' City');
```
- ʹ��concat��ƥ����� ��ֵ��ע��ǰ���ƥ��
![ע��ǰ��˳��.png](https://upload-images.jianshu.io/upload_images/11304499-8f0072b2be789e9c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name from world 
where capital like concat('%', name, '%');
```
- ʹ��concat��ƥ����� ��ֵ��ע��ǰ���ƥ�䣬��������ͬ��ʹ��and
![ʹ��and.png](https://upload-images.jianshu.io/upload_images/11304499-5b40d85e3c267e82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name from world 
where capital like concat('%', name, '%')
and capital not like concat(name);
```
- ʹ��concat��ƥ����� ��ֵ��ע��ǰ���ƥ�䣬��������ͬ��ʹ��and
![��������ʺ��׶�.png](https://upload-images.jianshu.io/upload_images/11304499-b3ab81098f083579.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name, replace(capital, name, '') as ext from world 
where capital like concat(name, '%')
and capital not like name;
```
- use case when then
1.1  eg. The CASE statement shown is used to substitute North America for Caribbean in the third column.
Show the name - but substitute Australasia for Oceania - for countries beginning with N.
![casewhen.png](https://upload-images.jianshu.io/upload_images/11304499-182274f8226ff330.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name,
    case when continent = 'Oceania' then 'Australasia'
      else continent end
from world
where name like 'N%';
```
1.2 Show the name and the continent - but substitute Eurasia for Europe and Asia; substitute America - for each country in North America or South America or Caribbean. Show countries beginning with A or B
![case2.png](https://upload-images.jianshu.io/upload_images/11304499-c36f53dd8b31eeb4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name, 
case when continent in ('Europe', 'Asia') then 'Eurasia' 
when continent in ('North America', 'South America', 'Caribbean') then 'America' 
else continent end
from world
where name like 'A%' or name like 'B%';
```
##### SELECT within SELECT Tutorial/zh
- ��ÿһ�������ҳ������e�ć��ң��г��޷� continent, �������� name ����e area�� (��Щ���ҵ�ӛ��У�AREA��NULL���]�������Y�ϵġ�)
```sql
select continent, name, area from world x
where area >= all(select area from world y where y.continent = x.continent and area > 0);
```
- �г��޷����Q����ÿ���޷��Ї������ְ���ĸ���������λ�ć�������(��ÿ��ֻ����һ��)
```slq
select continent, name from world x
where name <= all(select name from world y where y.continent = x.continent);
```
- �ҳ��޷ݣ�����ȫ�����Ҷ�����춻��� 25000000 �˿�. ���@Щ�޷��У��г���������name��continent �޷ݺ�population�˿ڡ�
```slq
select name, continent, population from world x
where continent not in (select distinct(continent) from world y where population >25000000);
```
- ��Щ���ҵ��˿���ͬ�޷ݵ�������������3�������ϡ��г� ��������name �� �޷� continent
```sql
select name, continent from world x 
where population >= all(select population*3 from world y where x.continent = y.continent and population > 0 and x.name <> y.name);
```
- �����ϲ�ԃ�����ҊLars Bender's�ِ��1012���򡣬F���҂���֪����ِ�µČ�ِ�������һꠡ������� goal ����еę�λmatchid���ǌ������game�ę�λid���҂������ڱ�� game���ҳ�ِ��1012���Y�ϡ�ֻ�@ʾِ��1012�� id, stadium, team1, team2
```sql
SELECT distinct(id),stadium,team1,team2
FROM game join goal
on matchid = id
where id = 1012
```
- ����SQL�г�ÿ���������T(����goal���)�͈��^��(����game���)�޸������@ʾÿһ�����������T��������������^�����ڡ�
```sql
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
where teamid = 'GER';
```
- ���eteam �A����ÿһ����꠵��Y�ϣ������̾��������ʹ���Z�� goal JOIN eteam on teamid=id���ƴ JOIN ���goal �� ���eteam��
�г�ÿ����ِ����10���gtime<=10���������T player, ���teamid, �̾�coach, ����r�ggtime
```sql
SELECT player, teamid, coach, gtime
FROM goal join eteam
on teamid = id
WHERE gtime<=10;
```

