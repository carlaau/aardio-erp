# Aardio ERP Architecture

## Overview

Aardio ERP is a client-server enterprise application framework built on the Aardio programming language ecosystem.

The system is composed of four major layers:

1. ERP Client
2. RPC Service Layer
3. CGI Service Layer
4. Database Layer

The architecture is designed to support modular business applications, centralized data access, automatic updates, and enterprise-scale deployment.

---

## High-Level Architecture

```text
+----------------------+
|     ERP Client       |
|  (Desktop App)       |
+----------+-----------+
           |
           | RPC
           v
+----------------------+
|     RPC Service      |
|   aardio-rpc         |
+----------+-----------+
           |
           | Internal API
           v
+----------------------+
|     CGI Service      |
|   aardio-cgi         |
+----------+-----------+
           |
           | SQL
           v
+----------------------+
|      Database        |
|  MSSQL / MySQL       |
+----------------------+
```

---

## Components

### ERP Client

Location:

```text
/aardio-erp
```

Responsibilities:

* User interface
* Business workflows
* Permission management
* Data presentation
* Automatic updates
* Client-side validation

---

### RPC Service

Location:

```text
/aardio-rpc
```

Responsibilities:

* Client communication
* Request routing
* Session handling
* Business service execution

The RPC layer acts as the primary communication bridge between desktop clients and backend services.

---

### CGI Service

Location:

```text
/aardio-cgi
```

Responsibilities:

* Web server integration
* HTTP request processing
* Backend service hosting
* API exposure

Typically deployed behind IIS.

---

### Shared Libraries

Location:

```text
/lib/carl
```

Responsibilities:

* Reusable utilities
* Common framework components
* Database helpers
* Shared business logic

These libraries are used across multiple system layers.

---

## Database Support

Supported databases:

* Microsoft SQL Server
* MySQL

Database connection settings are configured through:

```text
/wwwroot/system/config.aardio
```

---

## Deployment Model

Typical deployment:

```text
Client PC
    |
    v
ERP Client
    |
    v
RPC Service
    |
    v
CGI Service (IIS)
    |
    v
Database Server
```

---

## Modernization Goals

The project is currently undergoing a modernization effort focused on:

- Architecture review
- Module decoupling
- Improved testing
- Documentation enhancements
- Security review
- Contributor onboarding

For current plans and progress, see the
[Modernization Roadmap](../ROADMAP.md).

