# 1.爬虫前奏-什么是网络爬虫
## 1.1 爬虫实例
1. 搜索引擎。百度、谷歌、雅虎等
2. 抓取其他网站信息。伯乐在线，抓取其他网站的新闻等
3. 购物插件。惠惠购物助手，谷歌、ios、安卓等购物插件
4. 数据分析与研究，数据报告等。数据冰山、知乎专栏
5. 抢票软件等
## 1.2 网络爬虫
1. 一个模拟人类请求网站行为的程序，可以自动请求网页、并把数据抓取下来，然后使用一定的规则提取有价值的数据
2. 百度百科
## 1.3 通用爬虫和聚焦爬虫
1. 通用爬虫：搜索引擎抓取系统（百度、谷歌、搜狗等）的重要组成部分，主要是将互联网上的网页下载到本地，形成一个互联网内容的镜像备份
2. 聚焦爬虫：面向特定需求的一种网络爬虫程序，他与通用爬虫的区别在于：聚焦爬虫在实施网页抓取的时候会对内容进行筛选和处理，尽量保证只抓取与需求相关的网页信息
## 1.4 为什么使用Python
1. PHP：对多线程、异步支持不是很好，并发处理能力弱
2. Java：本身笨重，代码量大，重构成本比较高
3. C/C++：运行效率高，但学习和开发成本高
4. Python：代码简洁，开发效率高，支持的模块多。相关的HTTP请求模块和HTML解析模块非常丰富，还有Scrapy和Scrapy-redis框架让我们开发爬虫变得异常简单
## 1.5 准备工具
1. Python3.6开发环境
2. Pycharm 2017 professional版
3. 虚拟环境。virtualenv/virtualenvwrapper
2. HTTP协议和Chrome抓包工具
## 1.6 什么是http和https协议
1. Http协议：超文本传输协议，端口是80
2. HTTPS：HTTP的加密版本，加入了SSL协议，端口是443
## 1.7 在浏览器中发送一个http请求的过程
1. 用户在浏览器输入网址并回车，浏览器会向HTTP服务器发送HTTP请求。HTTP请求主要分为“Get”和“Post”方法
2. 比如我们输入：http://www.baidu.com，浏览器会发送1个Request请求去获取 http://www.baidu.com的html文件，服务器把Request文件对象发送回浏览器
3. 浏览器分析Request中的html文件，发现其中引用的其他文件，并自动再次发送Request去获取相关去房间
4. 当所有文件都下载成功后，网页会根据html语法结构，完整显示。
## 1.8 url详解
- URL：uniform resource locator
- 一般由以下几部分组成：
- scheme://host:port/path/?query-string=xxx#anchor
- scheme：网络协议，http、https、ftp等协议
- host：主机名，域名，如www.baidu.com
- port：端口
- path：查找路径
- query-string：查询字符串
- anchor：锚点。后台一般不用管，前段用来做页面定位
- 在浏览器中除英文字母，数字和部分符号外， 其他的全部使用百分号+十六进制进行编码（比如中文、特殊字符等）
## 1.9 常用的请求方法
1. 在http协议中，定义了8种请求方法，其中主要常用的：get、post请求
2. get请求：一般情况下，只从服务器获取数据下来，并不会对服务器资源产生任何影响的时候会使用get请求
3. post请求：向服务器发送数据（登录）、上传文件等，会对服务器资源产生影响的时候会使用post请求
部分网站和服务为了反爬虫，可能会将请求进行调换。
- eg. 拉勾网将get变换成post请求
### 1.9.1 请求头的常见参数
1. 在HTTP协议中，向服务器发送一个情况，数据分为3部分：
- 第1个是 把数据放在url中，
- 第2个是 把数据放在body中（在post请求中）
- 第3个是 把数据放在head中
2. user-agent：浏览器名称。爬虫的默认是Python，服务器一般会拒绝，需要手动设置。
3. referer：表明当前请求是从哪个url过来的，这个一般也是用来反爬虫的，如果不是从指定页面过来的，那么就不做相关的响应。
4. cookie：HTTP协议是无状态的，也就是同一个人发送了两次请求。服务器没有能力知道这两个请求是否来自同一个人，因此这是就用cookie来做表示。一般如果想要做登陆后才能访问的网站，那么就需要发送cookie信息了。
### 1.9.2 常见响应状态码
- 200：请求正常，服务器正常的返回数据。只能表明请求过程是正常的。但是数据是否正确，需要看实际情况（比如服务器伪装）
- 301：永久重定向，比如www.jingdong.com 到www.jd.com
- 302：临时重定向，访问需要登录的网站，就会重定向到登录页面
- 400：请求url错误
- 403：服务器拒绝访问，权限不够
- 500：服务器内部错误
### 1.9.3 Chrome抓包工具
- Chrome 开发者选项，F12 或 右键-检查，易用方便。

3.网络请求
3.1 urllib库
1.python中的基本网络请求库。可以模拟浏览器的行为，向指定的服务器发送1个请求，并可以保存服务器返回的数据。默认已经编码了，所以不能出现中文
2.urlopen函数
在python3 的urllib库中，所有和网络请求的相关方法，都集中在urllib.request 模块下面
from urllib import request
resp =request.urlopen('http://www.baidu.com')
print(resp.read())
url:请求的url
data：请求的data，如果设置了这个值，那么将变成post请求
返回值：返回值是1个 http.client.HTTPresponse对象，类文件句柄的对象，有read(size)、readline、readlines和getcode方法
3.2 urlretrieve 函数
将网页上的文件保存到本地
from urllib import request
request.urlretrieve('http://www.baidu.com/','baidu.html')
直接将html文件保存到当前目录
3.3 urlencode 函数
1.把字典数据转换为url编码的数据，urllib中默认已经编码了，所以不能出现中文
from ullib import parse
data = {'name':"爬虫数据",'greet':"hello world",'age':100}
qs = parse.urlencode(data)
print(qs)

3.4 parse_qs 函数
可以将经过编码后的url参数进行解码。示例代码如下：
```python
from urllib import parse
	qs = "name=%E7%88%AC%E8%99%AB%E5%9F%BA%E7%A1%80&greet=hello+world&age=100"
	print(parse.parse_qs(qs))
```
3.5 urlparse和urlsplit函数
#### requests库
- 虽然Python的标准库中,urllib模块已经包含了平常我们使用的大多数功能，但是它的 API 使用起来让人感觉不太好，而 Requests宣传是 “HTTP for Humans”，说明使用更简洁方便。
- 安装和文档地址：
- 1.利用pip可以非常方便的安装：
- 2.pip install requests

- 中文文档：http://docs.python-requests.org/zh_CN/latest/index.html
- github地址：https://github.com/requests/requests
#### 发送GET请求：
最简单的发送get请求就是通过requests.get来调用：
```python
response = requests.get("http://www.baidu.com/")
```
##### 添加headers和查询参数：
如果想添加 headers，可以传入headers参数来增加请求头中的headers信息。如果要将参数放在url中传递，可以利用 params 参数。相关示例代码如下：
```python
 import requests

 kw = {'wd':'中国'}

 headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36"}

 # params 接收一个字典或者字符串的查询参数，字典类型自动转换为url编码，不需要urlencode()
 response = requests.get("http://www.baidu.com/s", params = kw, headers = headers)

 # 查看响应内容，response.text 返回的是Unicode格式的数据
 print(response.text)

 # 查看响应内容，response.content返回的字节流数据
 print(response.content)

 # 查看完整url地址
 print(response.url)

 # 查看响应头部字符编码
 print(response.encoding)

 # 查看响应码
 print(response.status_code)
```
#### 发送POST请求：
最基本的POST请求可以使用post方法：
```python
response = requests.post("http://www.baidu.com/",data=data)
```
#### 传入data数据：
这时候就不要再使用urlencode进行编码了，直接传入一个字典进去就可以了。比如请求拉勾网的数据的代码：
``` python
 import requests

 url = "https://www.lagou.com/jobs/positionAjax.json?city=%E6%B7%B1%E5%9C%B3&needAddtionalResult=false&isSchoolJob=0"

 headers = {
     'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36',
     'Referer': 'https://www.lagou.com/jobs/list_python?labelWords=&fromSearch=true&suginput='
 }

 data = {
     'first': 'true',
     'pn': 1,
     'kd': 'python'
 }

 resp = requests.post(url,headers=headers,data=data)
 # 如果是json数据，直接可以调用json方法
 print(resp.json())
```
#### 使用代理：
使用requests添加代理也非常简单，只要在请求的方法中（比如get或者post）传递proxies参数就可以了。示例代码如下：
```python
import requests

url = "http://httpbin.org/get"

headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36',
}

proxy = {
    'http': '171.14.209.180:27829'
}

resp = requests.get(url,headers=headers,proxies=proxy)
with open('xx.html','w',encoding='utf-8') as fp:
    fp.write(resp.text)
```
#### cookie：
如果在一个响应中包含了cookie，那么可以利用cookies属性拿到这个返回的cookie值：
```python
import requests

url = "http://www.renren.com/PLogin.do"
data = {"email":"970138074@qq.com",'password':"pythonspider"}
resp = requests.get('http://www.baidu.com/')
print(resp.cookies)
print(resp.cookies.get_dict())
```
#### session：
之前使用urllib库，是可以使用opener发送多个请求，多个请求之间是可以共享cookie的。那么如果使用requests，也要达到共享cookie的目的，那么可以使用requests库给我们提供的session对象。
**注意，这里的session不是web开发中的那个session，这个地方只是一个会话的对象而已。还是以登录人人网为例，使用requests来实现。**
示例代码如下：
```python
import requests

url = "http://www.renren.com/PLogin.do"
data = {"email":"970138074@qq.com",'password':"pythonspider"}
headers = {
    'User-Agent': "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36"
}

# 登录
session = requests.session()
session.post(url,data=data,headers=headers)

# 访问大鹏个人中心
resp = session.get('http://www.renren.com/880151247/profile')

print(resp.text)
```
#### 处理不信任的SSL证书：
对于那些已经被信任的SSL整数的网站，比如:[https://www.baidu.com/](https://www.baidu.com/)，那么使用requests直接就可以正常的返回响应。示例代码如下：
```python
resp = requests.get('http://www.12306.cn/mormhweb/',verify=False)
print(resp.content.decode('utf-8'))
```
- mytest
```python
# 获取拉勾网的信息
import requests
url = 'https://www.lagou.com/jobs/positionAjax.json?city=%E6%B7%B1%E5%9C%B3&needAddtionalResult=false&isSchoolJob=0'
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36',
    'Referer': 'https://www.lagou.com/jobs/list_python?labelWords=&fromSearch=true&suginput='
}
data = {
    'first':'true'
    'pn':1
    'kw':python
}
r = requests.post(url,headers = headers,data = data)
print(r.read().decode('utf-8'))
print(r.json())

proxy = {
    'http': '171.14.209.180:27829'
}

rp = requests.get(url,headers = headers,proxies = proxy)
print(rp.json)
```
