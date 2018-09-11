#### 重要点拾遗
> 执行顺序：
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

- 使用concat来查找相同的 列值
![name和capital相同的记录.png](https://upload-images.jianshu.io/upload_images/11304499-9c4b29c8c6676026.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name from world
where name like concat(capital);
```
- 使用concat来匹配查找 列值，注意空格
![使用concat注意空格.png](https://upload-images.jianshu.io/upload_images/11304499-2d746126ef0f68f6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name from world 
where capital like concat(name, ' City');
```
- 使用concat来匹配查找 列值，注意前后的匹配
![注意前后顺序.png](https://upload-images.jianshu.io/upload_images/11304499-8f0072b2be789e9c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name from world 
where capital like concat('%', name, '%');
```
- 使用concat来匹配查找 列值，注意前后的匹配，但不能相同，使用and
![使用and.png](https://upload-images.jianshu.io/upload_images/11304499-5b40d85e3c267e82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
```sql
select name from world 
where capital like concat('%', name, '%')
and capital not like concat(name);
```
- 使用concat来匹配查找 列值，注意前后的匹配，但不能相同，使用and
![国家延伸词和首都.png](https://upload-images.jianshu.io/upload_images/11304499-b3ab81098f083579.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
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
- 在每一個州中找出最大面積的國家，列出洲份 continent, 國家名字 name 及面積 area。 (有些國家的記錄中，AREA是NULL，沒有填入資料的。)
```sql
select continent, name, area from world x
where area >= all(select area from world y where y.continent = x.continent and area > 0);
```
- 列出洲份名稱，和每個洲份中國家名字按子母順序是排首位的國家名。(即每洲只有列一國)
```slq
select continent, name from world x
where name <= all(select name from world y where y.continent = x.continent);
```
- 找出洲份，當中全部國家都有少於或等於 25000000 人口. 在這些洲份中，列出國家名字name，continent 洲份和population人口。
```slq
select name, continent, population from world x
where continent not in (select distinct(continent) from world y where population >25000000);
```
- 有些國家的人口是同洲份的所有其他國的3倍或以上。列出 國家名字name 和 洲份 continent
```sql
select name, continent from world x 
where population >= all(select population*3 from world y where x.continent = y.continent and population > 0 and x.name <> y.name);
```
- 由以上查詢，你可見Lars Bender's於賽事1012入球。現在我們想知道此賽事的對賽隊伍是哪一隊。留意在 goal 表格中的欄位matchid，是對應表格game的欄位id。我們可以在表格 game中找出賽事1012的資料。只顯示賽事1012的 id, stadium, team1, team2
```sql
SELECT distinct(id),stadium,team1,team2
FROM game join goal
on matchid = id
where id = 1012
```
- 以下SQL列出每個入球的球員(來自goal表格)和場館名(來自game表格)修改它來顯示每一個德國入球的球員名，隊伍名，場館和日期。
```sql
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
where teamid = 'GER';
```
- 表格eteam 貯存了每一國家隊的資料，包括教練。你可以使用語句 goal JOIN eteam on teamid=id來合拼 JOIN 表格goal 到 表格eteam。
列出每場球賽中首10分鐘gtime<=10有入球的球員 player, 隊伍teamid, 教練coach, 入球時間gtime
```sql
SELECT player, teamid, coach, gtime
FROM goal join eteam
on teamid = id
WHERE gtime<=10;
```

