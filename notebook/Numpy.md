### 安装Python
#### 1. 纯净安装
1.直接使用官网的软件来安装，然后通过cmd来设置环境变量（亦可通过计算机=>环境变量来配置）
2.安装pip。
- Windows：
```python
python -m pip install -U pip  
# -m 是 按照 模块；-U 是 if(exist, update, install)
path = %path%;d:\programes\Python\
# （这是python安装的绝对路径，按照自己软件按安装的位置填写）
path = %path%;d:\programes\Anaconda\Scripts\ 
# 添加conda、jupyter notebook等的路径到临时环境变量
```
- Linux 或 OS X:
```python
pip install -U pip
export PATH = "$PATH:/usr/local/bin/python"
```
3. 安装大部分的python库
```python
pip install <some software>
pip uninstall <some software>
```
#### 2. 使用Anaconda来安装
2.1 环境变量的配置
2.1.1 安装过程中添加。会提示添加环境变量，直接勾选。
2.1.2 安装后添加。
- Windows在cmd中输入：
```python
path = %path%;d:\programes\Anaconda\ 
# （这是python安装的绝对路径，按照自己软件按安装的位置填写）
path = %path%; d:\programes\Anaconda\Scripts\
# 添加conda、jupyter notebook等的路径到临时环境变量
```
- Linux：
```python
export PATH = "$PATH:/usr/local/bin/python"
```
2.1.3 命令行创建和启动环境
```python
conda create --name py36 python=3.6 # 创建环境
activate py36 # 激活环境

conda list # 列出安装的package
# 以下的Anaconda已经包含
conda install numpy #  会安装和更新所有依赖的库，pip不会
conda install -c marufr python-igraph=0.7.1.post6 
```
### numpy基础
> numpy的中文文档：[https://github.com/lisniuse/numpy-cn](https://github.com/lisniuse/numpy-cn)
