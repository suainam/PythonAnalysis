### ��װPython
#### 1. ������װ
1.ֱ��ʹ�ù������������װ��Ȼ��ͨ��cmd�����û������������ͨ�������=>�������������ã�
2.��װpip��
- Windows��
```python
python -m pip install -U pip  
# -m �� ���� ģ�飻-U �� if(exist, update, install)
path = %path%;d:\programes\Python\
# ������python��װ�ľ���·���������Լ��������װ��λ����д��
path = %path%;d:\programes\Anaconda\Scripts\ 
# ���conda��jupyter notebook�ȵ�·������ʱ��������
```
- Linux �� OS X:
```python
pip install -U pip
export PATH = "$PATH:/usr/local/bin/python"
```
3. ��װ�󲿷ֵ�python��
```python
pip install <some software>
pip uninstall <some software>
```
#### 2. ʹ��Anaconda����װ
2.1 ��������������
2.1.1 ��װ��������ӡ�����ʾ��ӻ���������ֱ�ӹ�ѡ��
2.1.2 ��װ����ӡ�
- Windows��cmd�����룺
```python
path = %path%;d:\programes\Anaconda\ 
# ������python��װ�ľ���·���������Լ��������װ��λ����д��
path = %path%; d:\programes\Anaconda\Scripts\
# ���conda��jupyter notebook�ȵ�·������ʱ��������
```
- Linux��
```python
export PATH = "$PATH:/usr/local/bin/python"
```
2.1.3 �����д�������������
```python
conda create --name py36 python=3.6 # ��������
activate py36 # �����

conda list # �г���װ��package
# ���µ�Anaconda�Ѿ�����
conda install numpy #  �ᰲװ�͸������������Ŀ⣬pip����
conda install -c marufr python-igraph=0.7.1.post6 
```
### numpy����
> numpy�������ĵ���[https://github.com/lisniuse/numpy-cn](https://github.com/lisniuse/numpy-cn)
