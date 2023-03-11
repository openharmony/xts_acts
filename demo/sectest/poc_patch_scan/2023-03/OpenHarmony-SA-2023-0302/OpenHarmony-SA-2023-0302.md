# OpenHarmony-SA-2023-0302

## 1、漏洞分析

**根因分析**

安装hap包时，包管理子系统并不检查配置文件config.json中部分字符串的长度，超长字符串导致出现各种问题

**漏洞复现步骤**

1. 准备一个hap文件
2. 打开hap包，修改config.json加入一个超长的字符串
3. 对hap包重新签名，安装到OH系统中
4. 重启OH，可以看到大部分的应用图标消失。如果这时候(不卸载直接使用安装命令)再次安装该hap包，剩余的应用图标也会消失
5. 卸载恶意应用，图标会重新复原

## 2、受影响版本

OpenHarmony-v3.1-Release到OpenHarmony-v3.1.4-Release

## 3、漏洞触发用例



## 4、验证效果

*提供执行效果截图*

**合入补丁前版本**

1.安装恶意应用并重启

<img src="\img\1.png" alt="1" style="zoom: 80%;" />

<img src="\img\2.png" alt="2" style="zoom:80%;" />

2.卸载应用

<img src="\img\3.png" alt="3" style="zoom: 80%;" />

<img src="D:\Work\OpenHarmony漏洞检测\OpenHarmony-SA-2023-0302\img\4.png" alt="4" style="zoom:80%;" />

**合入补丁后版本**

安装恶意应用，会直接报错

<img src="\img\5.png" alt="5" style="zoom: 80%;" />