# EasyVMS Docker

still not working, need someone who can solve it :(

## Problem

after experimenting for a few days, I seem to give up and try to find another version without a database, it looks like the program is always stuck when loading datebase, logs crash

```
024:fixme:exec:SHELL_execute flags ignored: 0x0000000c
019c:fixme:ntdll:NtQuerySystemInformation info_class SYSTEM_PERFORMANCE_INFORMATION
019c:fixme:ntdll:NtQueryInformationToken QueryInformationToken( ..., TokenElevation, ...) semi-stub
019c:fixme:shell:InitNetworkAddressControl stub

019c:fixme:msado15:connection_QueryInterface interface {00000126-0000-0000-c000-000000000046} not implemented
019c:fixme:msado15:connection_Open 0C6100F0, L"Provider='Microsoft.JET.OLEDB.4.0';Data source =db.mdb;Jet OLEDB:Database Password='02200059'", L"", 0C610204, 00000000

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:comsvcs:holder_Close (0B04E4C8) stub
019c:fixme:msado15:connection_QueryInterface interface {00000126-0000-0000-c000-000000000046} not implemented
019c:fixme:msado15:connection_Open 0C6100F0, L"Provider='Microsoft.JET.OLEDB.4.0';Data source =db.mdb;Jet OLEDB:Database Password='02200059'", L"", 0B04EDE4, 00000000

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"CREATE TABLE usertable ( id AUTOINCREMENT primary key, name TEXT, pwd TEXT, privilege LONG, keeppwd LONG, clouduser LONG, inheritid LONG )", 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"CREATE TABLE areatable ( id AUTOINCREMENT primary key, userid LONG, name TEXT )", 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"CREATE TABLE devtable ( id AUTOINCREMENT primary key, areaid LONG, userid LONG, channel INTEGER, protocol INTEGER, \t\t\tdevtype INTEGER, alias TEXT, mac TEXT, ip TEXT, did TEXT, account TEXT, pwd TEXT, boardtype TEXT, serial TEXT, port INTEGER, firmware TEXT, login_url TEXT, http_port IN"..., 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"CREATE TABLE loopgroup ( id AUTOINCREMENT primary key, userid LONG, name TEXT )", 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"CREATE TABLE loopdev ( id AUTOINCREMENT primary key, loopid LONG, devid LONG, areaid LONG, userid LONG, \t\t\t\t\t\t  lowpart INTEGER, highpart INTEGER )", 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"CREATE TABLE applogtable ( id AUTOINCREMENT primary key, optid LONG, devid LONG, areaid LONG, devalias TEXT, optname TEXT, areaname TEXT, logtime DOUBLE, appaction LONG, channel LONG, append TEXT )", 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"CREATE TABLE previewtable ( id AUTOINCREMENT primary key, areaid LONG, userid LONG, devUniqueId LONG,       channel INTEGER, preview_layout INTEGER )", 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"insert into usertable ( name, pwd, privilege, clouduser, inheritid ) values ( 'root', '46CF6FE35B61C85A5D5178491DBF994F', 0, 0, 0 )", 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"insert into usertable ( name, pwd, privilege, clouduser, inheritid ) values ( 'admin', 'F09F35A5637839458E462E6350ECBCE4', 1, 0, 0 )", 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_Execute 0C6100F0, L"insert into areatable ( userid, name ) values ( 2, 'default area' )", 00316E84, 00000001, 00316E64

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
019c:fixme:msado15:connection_QueryInterface interface {00000126-0000-0000-c000-000000000046} not implemented
019c:fixme:msado15:connection_Open 0C6100F0, L"Provider='Microsoft.JET.OLEDB.4.0';Data source =db.mdb;Jet OLEDB:Database Password='02200059'", L"", 0B04EC5C, 00000000

019c:fixme:msado15:supporterror_InterfaceSupportsErrorInfo 0C6100F0, {00000515-0000-0010-8000-00aa006d2ea4}
01b0:fixme:winsock:WSAIoctl WS_SIO_UDP_CONNRESET stub
```

## Some documentation for debug

* https://forum.winehq.org/viewtopic.php?f=8&t=31519
* http://www.vbforums.com/showthread.php?868713-Open-ADODB-connection-in-Linux-wine-using-mysql-connector-odbc
* https://forum.altlinux.org/index.php?topic=43661.0
* https://stackoverflow.com/questions/13811179/where-how-can-i-download-and-install-the-microsoft-jet-oledb-4-0-for-windows-8
* https://forum.winehq.org/viewtopic.php?t=4708
* https://users.openoffice.narkive.com/EpCLbLJx/wine-debugging-visualbasic-application
* https://forum.winehq.org/viewtopic.php?t=33811&p=127531
* https://forum.winehq.org/viewtopic.php?t=24011
* https://forum.winehq.org/viewtopic.php?t=28096
* https://www.sanitarium.co.za/how-to-get-wine-windows-mysql-connectorodbc-and-ubuntu-13-10-to-all-be-friends/