# 1.����ǰ��-ʲô����������
## 1.1 ����ʵ��
1. �������档�ٶȡ��ȸ衢�Ż���
2. ץȡ������վ��Ϣ���������ߣ�ץȡ������վ�����ŵ�
3. ���������ݻݹ������֣��ȸ衢ios����׿�ȹ�����
4. ���ݷ������о������ݱ���ȡ����ݱ�ɽ��֪��ר��
5. ��Ʊ�����
## 1.2 ��������
1. һ��ģ������������վ��Ϊ�ĳ��򣬿����Զ�������ҳ����������ץȡ������Ȼ��ʹ��һ���Ĺ�����ȡ�м�ֵ������
2. �ٶȰٿ�
## 1.3 ͨ������;۽�����
1. ͨ�����棺��������ץȡϵͳ���ٶȡ��ȸ衢�ѹ��ȣ�����Ҫ��ɲ��֣���Ҫ�ǽ��������ϵ���ҳ���ص����أ��γ�һ�����������ݵľ��񱸷�
2. �۽����棺�����ض������һ�����������������ͨ��������������ڣ��۽�������ʵʩ��ҳץȡ��ʱ�������ݽ���ɸѡ�ʹ���������ֻ֤ץȡ��������ص���ҳ��Ϣ
## 1.4 Ϊʲôʹ��Python
1. PHP���Զ��̡߳��첽֧�ֲ��Ǻܺã���������������
2. Java�������أ����������ع��ɱ��Ƚϸ�
3. C/C++������Ч�ʸߣ���ѧϰ�Ϳ����ɱ���
4. Python�������࣬����Ч�ʸߣ�֧�ֵ�ģ��ࡣ��ص�HTTP����ģ���HTML����ģ��ǳ��ḻ������Scrapy��Scrapy-redis��������ǿ����������쳣��
## 1.5 ׼������
1. Python3.6��������
2. Pycharm 2017 professional��
3. ���⻷����virtualenv/virtualenvwrapper
2. HTTPЭ���Chromeץ������
## 1.6 ʲô��http��httpsЭ��
1. HttpЭ�飺���ı�����Э�飬�˿���80
2. HTTPS��HTTP�ļ��ܰ汾��������SSLЭ�飬�˿���443
## 1.7 ��������з���һ��http����Ĺ���
1. �û��������������ַ���س������������HTTP����������HTTP����HTTP������Ҫ��Ϊ��Get���͡�Post������
2. �����������룺http://www.baidu.com��������ᷢ��1��Request����ȥ��ȡ http://www.baidu.com��html�ļ�����������Request�ļ������ͻ������
3. ���������Request�е�html�ļ��������������õ������ļ������Զ��ٴη���Requestȥ��ȡ���ȥ����
4. �������ļ������سɹ�����ҳ�����html�﷨�ṹ��������ʾ��
## 1.8 url���
- URL��uniform resource locator
- һ�������¼�������ɣ�
- scheme://host:port/path/?query-string=xxx#anchor
- scheme������Э�飬http��https��ftp��Э��
- host������������������www.baidu.com
- port���˿�
- path������·��
- query-string����ѯ�ַ���
- anchor��ê�㡣��̨һ�㲻�ùܣ�ǰ��������ҳ�涨λ
- ��������г�Ӣ����ĸ�����ֺͲ��ַ����⣬ ������ȫ��ʹ�ðٷֺ�+ʮ�����ƽ��б��루�������ġ������ַ��ȣ�
## 1.9 ���õ����󷽷�
1. ��httpЭ���У�������8�����󷽷���������Ҫ���õģ�get��post����
2. get����һ������£�ֻ�ӷ�������ȡ����������������Է�������Դ�����κ�Ӱ���ʱ���ʹ��get����
3. post������������������ݣ���¼�����ϴ��ļ��ȣ���Է�������Դ����Ӱ���ʱ���ʹ��post����
������վ�ͷ���Ϊ�˷����棬���ܻὫ������е�����
- eg. ��������get�任��post����
### 1.9.1 ����ͷ�ĳ�������
1. ��HTTPЭ���У������������һ����������ݷ�Ϊ3���֣�
- ��1���� �����ݷ���url�У�
- ��2���� �����ݷ���body�У���post�����У�
- ��3���� �����ݷ���head��
2. user-agent����������ơ������Ĭ����Python��������һ���ܾ�����Ҫ�ֶ����á�
3. referer��������ǰ�����Ǵ��ĸ�url�����ģ����һ��Ҳ������������ģ�������Ǵ�ָ��ҳ������ģ���ô�Ͳ�����ص���Ӧ��
4. cookie��HTTPЭ������״̬�ģ�Ҳ����ͬһ���˷������������󡣷�����û������֪�������������Ƿ�����ͬһ���ˣ�������Ǿ���cookie������ʾ��һ�������Ҫ����½����ܷ��ʵ���վ����ô����Ҫ����cookie��Ϣ�ˡ�
### 1.9.2 ������Ӧ״̬��
- 200�����������������������ķ������ݡ�ֻ�ܱ�����������������ġ����������Ƿ���ȷ����Ҫ��ʵ����������������αװ��
- 301�������ض��򣬱���www.jingdong.com ��www.jd.com
- 302����ʱ�ض��򣬷�����Ҫ��¼����վ���ͻ��ض��򵽵�¼ҳ��
- 400������url����
- 403���������ܾ����ʣ�Ȩ�޲���
- 500���������ڲ�����
### 1.9.3 Chromeץ������
- Chrome ������ѡ�F12 �� �Ҽ�-��飬���÷��㡣

3.��������
3.1 urllib��
1.python�еĻ�����������⡣����ģ�����������Ϊ����ָ���ķ���������1�����󣬲����Ա�����������ص����ݡ�Ĭ���Ѿ������ˣ����Բ��ܳ�������
2.urlopen����
��python3 ��urllib���У����к������������ط�������������urllib.request ģ������
from urllib import request
resp =request.urlopen('http://www.baidu.com')
print(resp.read())
url:�����url
data�������data��������������ֵ����ô�����post����
����ֵ������ֵ��1�� http.client.HTTPresponse�������ļ�����Ķ�����read(size)��readline��readlines��getcode����
3.2 urlretrieve ����
����ҳ�ϵ��ļ����浽����
from urllib import request
request.urlretrieve('http://www.baidu.com/','baidu.html')
ֱ�ӽ�html�ļ����浽��ǰĿ¼
3.3 urlencode ����
1.���ֵ�����ת��Ϊurl��������ݣ�urllib��Ĭ���Ѿ������ˣ����Բ��ܳ�������
from ullib import parse
data = {'name':"��������",'greet':"hello world",'age':100}
qs = parse.urlencode(data)
print(qs)

3.4 parse_qs ����
���Խ�����������url�������н��롣ʾ���������£�
```python
from urllib import parse
	qs = "name=%E7%88%AC%E8%99%AB%E5%9F%BA%E7%A1%80&greet=hello+world&age=100"
	print(parse.parse_qs(qs))
```
3.5 urlparse��urlsplit����
#### requests��
- ��ȻPython�ı�׼����,urllibģ���Ѿ�������ƽ������ʹ�õĴ�������ܣ��������� API ʹ���������˸о���̫�ã��� Requests������ ��HTTP for Humans����˵��ʹ�ø���෽�㡣
- ��װ���ĵ���ַ��
- 1.����pip���Էǳ�����İ�װ��
- 2.pip install requests

- �����ĵ���http://docs.python-requests.org/zh_CN/latest/index.html
- github��ַ��https://github.com/requests/requests
#### ����GET����
��򵥵ķ���get�������ͨ��requests.get�����ã�
```python
response = requests.get("http://www.baidu.com/")
```
##### ���headers�Ͳ�ѯ������
�������� headers�����Դ���headers��������������ͷ�е�headers��Ϣ�����Ҫ����������url�д��ݣ��������� params ���������ʾ���������£�
```python
 import requests

 kw = {'wd':'�й�'}

 headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36"}

 # params ����һ���ֵ�����ַ����Ĳ�ѯ�������ֵ������Զ�ת��Ϊurl���룬����Ҫurlencode()
 response = requests.get("http://www.baidu.com/s", params = kw, headers = headers)

 # �鿴��Ӧ���ݣ�response.text ���ص���Unicode��ʽ������
 print(response.text)

 # �鿴��Ӧ���ݣ�response.content���ص��ֽ�������
 print(response.content)

 # �鿴����url��ַ
 print(response.url)

 # �鿴��Ӧͷ���ַ�����
 print(response.encoding)

 # �鿴��Ӧ��
 print(response.status_code)
```
#### ����POST����
�������POST�������ʹ��post������
```python
response = requests.post("http://www.baidu.com/",data=data)
```
#### ����data���ݣ�
��ʱ��Ͳ�Ҫ��ʹ��urlencode���б����ˣ�ֱ�Ӵ���һ���ֵ��ȥ�Ϳ����ˡ��������������������ݵĴ��룺
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
 # �����json���ݣ�ֱ�ӿ��Ե���json����
 print(resp.json())
```
#### ʹ�ô���
ʹ��requests��Ӵ���Ҳ�ǳ��򵥣�ֻҪ������ķ����У�����get����post������proxies�����Ϳ����ˡ�ʾ���������£�
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
#### cookie��
�����һ����Ӧ�а�����cookie����ô��������cookies�����õ�������ص�cookieֵ��
```python
import requests

url = "http://www.renren.com/PLogin.do"
data = {"email":"970138074@qq.com",'password':"pythonspider"}
resp = requests.get('http://www.baidu.com/')
print(resp.cookies)
print(resp.cookies.get_dict())
```
#### session��
֮ǰʹ��urllib�⣬�ǿ���ʹ��opener���Ͷ�����󣬶������֮���ǿ��Թ���cookie�ġ���ô���ʹ��requests��ҲҪ�ﵽ����cookie��Ŀ�ģ���ô����ʹ��requests��������ṩ��session����
**ע�⣬�����session����web�����е��Ǹ�session������ط�ֻ��һ���Ự�Ķ�����ѡ������Ե�¼������Ϊ����ʹ��requests��ʵ�֡�**
ʾ���������£�
```python
import requests

url = "http://www.renren.com/PLogin.do"
data = {"email":"970138074@qq.com",'password':"pythonspider"}
headers = {
    'User-Agent': "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36"
}

# ��¼
session = requests.session()
session.post(url,data=data,headers=headers)

# ���ʴ�����������
resp = session.get('http://www.renren.com/880151247/profile')

print(resp.text)
```
#### �������ε�SSL֤�飺
������Щ�Ѿ������ε�SSL��������վ������:[https://www.baidu.com/](https://www.baidu.com/)����ôʹ��requestsֱ�ӾͿ��������ķ�����Ӧ��ʾ���������£�
```python
resp = requests.get('http://www.12306.cn/mormhweb/',verify=False)
print(resp.content.decode('utf-8'))
```
- mytest
```python
# ��ȡ����������Ϣ
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
