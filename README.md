## Documentation

- Architecture Overview: docs/architecture.md
- Modernization Roadmap: ROADMAP.md
  
# Aardio ERP

Open-source Enterprise Application Framework for the Aardio ecosystem.

Aardio ERP is a full-stack enterprise application framework built with the Aardio programming language. The project includes CGI services, RPC services, shared libraries, automatic update components, and a modular ERP client framework for developing business applications.

The repository serves as both a production-ready framework and a reference implementation for enterprise software architecture within the Aardio ecosystem.

## Project Status

Aardio ERP is currently undergoing a modernization effort focused on:

* Architecture review
* Module decoupling
* Test coverage
* Documentation improvements
* Security review
* Contributor onboarding

For more details, see [ROADMAP.md](ROADMAP.md).

---

# 中文说明

aardio-erp 支持 aardio 最新以上版本。

## 项目简介

aardio-erp 是基于 aardio 开发的企业应用开发框架，包含 CGI 服务端、RPC 服务端、共享基础库、自动升级模块以及 ERP 客户端框架。

项目不仅可用于快速开发企业管理系统，同时也是 aardio 生态中较完整的企业级应用架构参考实现。

## 项目结构

`/aardio-cgi`

CGI 服务源码，用于发布 aardio-cgi.exe

`/aardio-rpc`

RPC 服务端源码

`/aardio-erp`

ERP 框架客户端源码

`/lib/carl`

共享基础库

## 系统截图

![image](http://bbs.aardio.org/data/attachment/forum/201505/10/163148ylheqev9dhrvpwnw.png)

![image](http://bbs.aardio.org/data/attachment/forum/201505/10/163202lu9293n4zky923ug.png)

## 功能特性

* CGI + RPC 分层架构
* MSSQL / MySQL 数据库支持
* 自动在线升级
* 模块化客户端框架
* 权限与用户管理
* 企业业务系统开发基础框架
* 支持二次开发与扩展

## 快速部署

### 1. 安装基础库

将：

`\lib\carl\`

复制到 aardio 标准库目录：

`\lib\carl\`

### 2. 部署服务端

上传：

`\aardio-erp\rpc\`

目录全部文件至服务器。

IIS 目录指向：

`\wwwroot`

并添加模块映射至：

`\aardio-cgi.exe`

### 3. 初始化数据库

创建数据库后导入：

* aardio-erp-mssql.sql
* aardio-erp-mysql(utf8,InnoDB).sql

### 4. 默认管理员

账号：

admin

密码：

admin

### 5. 配置数据库连接

编辑：

`\wwwroot\system\config.aardio`

### 6. 配置客户端

编辑：

`\lib\config.aardio`

配置：

* config.__drive
* config.__appRoad

### 7. 发布升级包

上传以下文件到：

`\wwwroot\update\`

* Erp.exe
* aardio-erp.rar
* index.html

客户端将自动检测并完成升级。

## Modernization Roadmap

See:

[ROADMAP.md](ROADMAP.md)

## License

MIT License

## Official Website

https://www.aardio.com
