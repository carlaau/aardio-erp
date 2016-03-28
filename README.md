#aardio-erp,仅支持aardio10以上版本

## 目录文件说明

`/aardio-cgi` cgi源码,用于发布aardio-cgi.exe

`/aardio-rpc` rpc服务端源码

`/aardio-erp` erp框架客户端源码

![image](http://bbs.aardio.org/data/attachment/forum/201505/10/163148ylheqev9dhrvpwnw.png)

## 框架使用步骤

1.先把用户库 `\lib\carl\` 复制到 ide标准库 `\lib\carl\` 目录下,否则运行不了.(此自定义库可做为标准库使用,)

2.把\aardio-erp\rpc\目录下所有文件上传到服务端,IIS目录指向 `\wwwroot`, 并添加模块映射指向`\aardio-cgi.exe`

3.架设数据库,先手动建好数据库,并导入数据库相应安装文件aardio-erp-mssql.sql或aardio-erp-mysql(utf8,InnoDB).sql

4.默认超级管理员帐号: admin 密码: admin

5.配置服务端数据库连接文件 `\wwwroot\system\config.aardio`

6.打开客户端工程文件

7.配置客户端数据库类型 `\lib\config.aardio  (config.__drive值)`

8.配置客户端线路 `\lib\config.aardio  (config.__appRoad值)`

9.发布EXE,打开 `\Publish\update\`, 把相应的文件上传到服务端 `\wwwroot\update\` 目录下就可以,客户端将会自动升级,具体操作如下

  a. 请手动把 Erp.exe 放于RAR压缩包内

  b. 记事本打开index.html, 填写更新日志,(可不写)

  c. 请把 Erp.exe,index.html,aardio-erp.rar 三个文件,上传到网站对应的update目录下,就可实现客户端自动升级功能

## 反馈
技术支持论坛: http://bbs.aardio.org/

QQ群: 70517368

官方:http://www.aardio.com