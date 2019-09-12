** 直接在psql执行insert或者select的时候，设置client_encoding=gbk(默认)，不乱码**
** 使用“\i sql.sql”（sql文件是utf8编码）命令的时候，如果sql文件中有中文，一定要先执行"set client_encoding=utf8;"，设置后按照规则，客户端不转换，直接把接受的字符作为utf8编码传给服务器端，而文件本身就是utf8,所以不乱码；同理如果sql是ansi编码即gbk编码的话，确保client_encoding为gbk，总之sql文件与clietn_encoding编码一致，才不会乱码**

# 创建数据库
\l
CREATE DATABASE tyk;

# 切换到tyk数据库
\c tyk;

# 创建表
CREATE TABLE sales(
	年份 int,
	月份 int,
	收款时间 date,
	小票号 text,
	商品代码 text,
	商品名称 text,
	规格 text,
	数量 numeric,
	门店名称 text,
	生产厂家 text,
	定价客户 text,
	含税单价 numeric,
	折让后金额 numeric,
	批次含税进价 numeric,
	毛利率 numeric,
	补差 numeric,
	补差合计 numeric,
	合计毛利额 numeric,
	实际毛利率 numeric
);

# 编码
show server_encoding;
show client_encoding;
\! chcp

set client_encoding to 'utf8';
# 导入数据
\COPY sales FROM 'D:\工具\test\sales.csv' with CSV HEADER;

# 改变dos的编码，但是一致出现"no enough memory"
\! chcp 65001
set client_encoding to 'gbk';

# 查询
SELECT * FROM sales;

# 删除缺失值
DELETE FROM sales where 商品名称 IS NULL;

# 找到唯一值
SELECT DISTINCT 门店名称 FROM sales;

# 更改列名
ALTER TABLE sales RENAME COLUMN 门店名称 TO 药房名称;
ALTER TABLE sales RENAME COLUMN 收款时间 TO 销售时间;
ALTER TABLE sales RENAME COLUMN 折让后金额 TO 销售金额;
ALTER TABLE sales RENAME COLUMN 合计毛利额 TO 毛利额;
ALTER TABLE sales DROP COLUMN 毛利率;
ALTER TABLE sales RENAME COLUMN 实际毛利率 TO 毛利率;

# 增加新列并计算补差前毛利率
ALTER TABLE sales ADD 补差前毛利率 numeric;
DELETE FROM sales WHERE 批次含税进价=0;
UPDATE sales SET 补差前毛利率 = 含税单价/批次含税进价-1;

# 计算不同商品的折扣力度
SELECT 商品代码, 商品名称, MAX(含税单价), MIN(含税单价) FROM sales GROUP BY 商品代码, 商品名称 LIMIT 10; 

CREATE TABLE data2 AS
SELECT 商品代码, MAX(含税单价) AS 最高价, MIN(含税单价) AS 最低价 FROM sales GROUP BY 商品代码;

ALTER TABLE data2 ADD COLUMN 折扣力度 numeric;
DELETE FROM data2 WHERE 最高价=0;
UPDATE data2 set 折扣力度 = 最低价/最高价;

# 进行数据的合并
ALTER TABLE data2 RENAME COLUMN 商品代码 TO 商品代码2;
CREATE TABLE merged AS
SELECT * FROM sales s, data2 d2 where s.商品代码=d2.商品代码2; 

# 删掉不必要的数据
ALTER TABLE merged DROP 最高价;
ALTER TABLE merged DROP 最低价;
ALTER TABLE merged DROP 商品代码2;

# 数据的导出，**注意client的编码**
SET client_encoding TO 'utf8';
\COPY merged TO 'C:\Users\17870\Desktop\结果数据.csv' WITH CSV HEADER;

--数据的拆解
--因为服务端是utf8，客户端是gbk，终端dos也是gbk，所以如果按照下面的输入，那么就无法在服务端进行搜索，会出现错误。但是如果将客户端修改成utf8，那么输入的时候也会返回错误。还没有想到好的解决办法 
SELECT DISTINCT 商品名称 FROM merged;

CREATE TABLE data_band AS SELECT 商品代码, COUNT(商品代码) FROM merged GROUP BY 商品代码;

SELECT * FROM data_band LIMIT 10;

DROP TABLE data_price;
CREATE TABLE data_price AS SELECT 商品代码,含税单价 FROM merged WHERE 销售时间='2018/10/10';

ALTER TABLE data_band ADD COLUMN price1010 numeric;
UPDATE data_band SET price1010 = 含税单价 FROM data_price WHERE data_band.商品代码 = data_price.商品代码;
DELETE FROM data_band WHERE price1010 IS NULL;

--如何进行行列的转换，来获得不同商品代码在10/10~10/18期间的商品价格