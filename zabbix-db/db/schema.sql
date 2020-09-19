CREATE DATABASE zabbix;

USE zabbix;

SET character_set_client = utf8;
SET character_set_connection = utf8;
SET character_set_results = utf8;
SET collation_connection = utf8_general_ci;

TABLE|users|userid|ZBX_DATA
FIELD           |userid         |t_id           |       |NOT NULL       |0
FIELD           |alias          |t_varchar(100) |''     |NOT NULL       |0
FIELD           |name           |t_varchar(100) |''     |NOT NULL       |0
FIELD           |surname        |t_varchar(100) |''     |NOT NULL       |0
FIELD           |passwd         |t_varchar(60)  |''     |NOT NULL       |0
FIELD           |url            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |autologin      |t_integer      |'0'    |NOT NULL       |0
FIELD           |autologout     |t_varchar(32)  |'15m'  |NOT NULL       |0
FIELD           |lang           |t_varchar(7)   |'default'|NOT NULL     |ZBX_NODATA
FIELD           |refresh        |t_varchar(32)  |'30s'  |NOT NULL       |0
FIELD           |type           |t_integer      |'1'    |NOT NULL       |0
FIELD           |theme          |t_varchar(128) |'default'|NOT NULL     |ZBX_NODATA
FIELD           |attempt_failed |t_integer      |0      |NOT NULL       |ZBX_NODATA
FIELD           |attempt_ip     |t_varchar(39)  |''     |NOT NULL       |ZBX_NODATA
FIELD           |attempt_clock  |t_integer      |0      |NOT NULL       |ZBX_NODATA
FIELD           |rows_per_page  |t_integer      |50     |NOT NULL       |0
FIELD           |timezone       |t_varchar(50)  |'default'|NOT NULL     |ZBX_NODATA
UNIQUE          |1              |alias

TABLE|maintenances|maintenanceid|ZBX_DATA
FIELD           |maintenanceid  |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(128) |''     |NOT NULL       |0
FIELD           |maintenance_type|t_integer     |'0'    |NOT NULL       |0
FIELD           |description    |t_shorttext    |''     |NOT NULL       |0
FIELD           |active_since   |t_integer      |'0'    |NOT NULL       |0
FIELD           |active_till    |t_integer      |'0'    |NOT NULL       |0
FIELD           |tags_evaltype  |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |active_since,active_till
UNIQUE          |2              |name

TABLE|hosts|hostid|ZBX_TEMPLATE
FIELD           |hostid         |t_id           |       |NOT NULL       |0
FIELD           |proxy_hostid   |t_id           |       |NULL           |0                      |1|hosts        |hostid
|RESTRICT
FIELD           |host           |t_varchar(128) |''     |NOT NULL       |ZBX_PROXY
FIELD           |status         |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |disable_until  |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |error          |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |available      |t_integer      |'0'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |errors_from    |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |lastaccess     |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ipmi_authtype  |t_integer      |'-1'   |NOT NULL       |ZBX_PROXY
FIELD           |ipmi_privilege |t_integer      |'2'    |NOT NULL       |ZBX_PROXY
FIELD           |ipmi_username  |t_varchar(16)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |ipmi_password  |t_varchar(20)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |ipmi_disable_until|t_integer   |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ipmi_available |t_integer      |'0'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |snmp_disable_until|t_integer   |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |snmp_available |t_integer      |'0'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |maintenanceid  |t_id           |       |NULL           |ZBX_NODATA             |2|maintenances |                                                      |RESTRICT
FIELD           |maintenance_status|t_integer   |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |maintenance_type|t_integer     |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |maintenance_from|t_integer     |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ipmi_errors_from|t_integer     |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |snmp_errors_from|t_integer     |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ipmi_error     |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |snmp_error     |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |jmx_disable_until|t_integer    |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |jmx_available  |t_integer      |'0'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |jmx_errors_from|t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |jmx_error      |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |name           |t_varchar(128) |''     |NOT NULL       |ZBX_PROXY
FIELD           |flags          |t_integer      |'0'    |NOT NULL       |0
FIELD           |templateid     |t_id           |       |NULL           |0                      |3|hosts        |hostid
FIELD           |description    |t_shorttext    |''     |NOT NULL       |0
FIELD           |tls_connect    |t_integer      |'1'    |NOT NULL       |ZBX_PROXY
FIELD           |tls_accept     |t_integer      |'1'    |NOT NULL       |ZBX_PROXY
FIELD           |tls_issuer     |t_varchar(1024)|''     |NOT NULL       |ZBX_PROXY
FIELD           |tls_subject    |t_varchar(1024)|''     |NOT NULL       |ZBX_PROXY
FIELD           |tls_psk_identity|t_varchar(128)|''     |NOT NULL       |ZBX_PROXY
FIELD           |tls_psk        |t_varchar(512) |''     |NOT NULL       |ZBX_PROXY
FIELD           |proxy_address  |t_varchar(255) |''     |NOT NULL       |0
FIELD           |auto_compress  |t_integer      |'1'    |NOT NULL       |0
FIELD           |discover       |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |host
INDEX           |2              |status
INDEX           |3              |proxy_hostid
INDEX           |4              |name
INDEX           |5              |maintenanceid

TABLE|hstgrp|groupid|ZBX_DATA
FIELD           |groupid        |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |internal       |t_integer      |'0'    |NOT NULL       |0
FIELD           |flags          |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |name

TABLE|group_prototype|group_prototypeid|ZBX_TEMPLATE
FIELD           |group_prototypeid|t_id         |       |NOT NULL       |0
FIELD           |hostid         |t_id           |       |NOT NULL       |0                      |1|hosts
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |groupid        |t_id           |       |NULL           |0                      |2|hstgrp       |                                                      |RESTRICT
FIELD           |templateid     |t_id           |       |NULL           |0                      |3|group_prototype|group_prototypeid
INDEX           |1              |hostid

TABLE|group_discovery|groupid|ZBX_TEMPLATE
FIELD           |groupid        |t_id           |       |NOT NULL       |0                      |1|hstgrp
FIELD           |parent_group_prototypeid|t_id  |       |NOT NULL       |0                      |2|group_prototype|group_prototypeid|RESTRICT
FIELD           |name           |t_varchar(64)  |''     |NOT NULL       |ZBX_NODATA
FIELD           |lastcheck      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ts_delete      |t_time         |'0'    |NOT NULL       |ZBX_NODATA

TABLE|screens|screenid|ZBX_TEMPLATE
FIELD           |screenid       |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(255) |       |NOT NULL       |0
FIELD           |hsize          |t_integer      |'1'    |NOT NULL       |0
FIELD           |vsize          |t_integer      |'1'    |NOT NULL       |0
FIELD           |templateid     |t_id           |       |NULL           |0                      |1|hosts        |hostid
FIELD           |userid         |t_id           |       |NULL           |0                      |3|users        |                                                      |RESTRICT
FIELD           |private        |t_integer      |'1'    |NOT NULL       |0
INDEX           |1              |templateid

TABLE|screens_items|screenitemid|ZBX_TEMPLATE
FIELD           |screenitemid   |t_id           |       |NOT NULL       |0
FIELD           |screenid       |t_id           |       |NOT NULL       |0                      |1|screens
FIELD           |resourcetype   |t_integer      |'0'    |NOT NULL       |0
FIELD           |resourceid     |t_id           |'0'    |NOT NULL       |0
FIELD           |width          |t_integer      |'320'  |NOT NULL       |0
FIELD           |height         |t_integer      |'200'  |NOT NULL       |0
FIELD           |x              |t_integer      |'0'    |NOT NULL       |0
FIELD           |y              |t_integer      |'0'    |NOT NULL       |0
FIELD           |colspan        |t_integer      |'1'    |NOT NULL       |0
FIELD           |rowspan        |t_integer      |'1'    |NOT NULL       |0
FIELD           |elements       |t_integer      |'25'   |NOT NULL       |0
FIELD           |valign         |t_integer      |'0'    |NOT NULL       |0
FIELD           |halign         |t_integer      |'0'    |NOT NULL       |0
FIELD           |style          |t_integer      |'0'    |NOT NULL       |0
FIELD           |url            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |dynamic        |t_integer      |'0'    |NOT NULL       |0
FIELD           |sort_triggers  |t_integer      |'0'    |NOT NULL       |0
FIELD           |application    |t_varchar(255) |''     |NOT NULL       |0
FIELD           |max_columns    |t_integer      |'3'    |NOT NULL       |0
INDEX           |1              |screenid

TABLE|screen_user|screenuserid|ZBX_DATA
FIELD           |screenuserid|t_id              |       |NOT NULL       |0
FIELD           |screenid       |t_id           |       |NOT NULL       |0                      |1|screens
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |2|users
FIELD           |permission     |t_integer      |'2'    |NOT NULL       |0
UNIQUE          |1              |screenid,userid

TABLE|screen_usrgrp|screenusrgrpid|ZBX_DATA
FIELD           |screenusrgrpid|t_id            |       |NOT NULL       |0
FIELD           |screenid       |t_id           |       |NOT NULL       |0                      |1|screens
FIELD           |usrgrpid       |t_id           |       |NOT NULL       |0                      |2|usrgrp
FIELD           |permission     |t_integer      |'2'    |NOT NULL       |0
UNIQUE          |1              |screenid,usrgrpid

TABLE|slideshows|slideshowid|ZBX_DATA
FIELD           |slideshowid    |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |delay          |t_varchar(32)  |'30s'  |NOT NULL       |0
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |3|users        |                                                      |RESTRICT
FIELD           |private        |t_integer      |'1'    |NOT NULL       |0
UNIQUE          |1              |name

TABLE|slideshow_user|slideshowuserid|ZBX_DATA
FIELD           |slideshowuserid|t_id           |       |NOT NULL       |0
FIELD           |slideshowid    |t_id           |       |NOT NULL       |0                      |1|slideshows
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |2|users
FIELD           |permission     |t_integer      |'2'    |NOT NULL       |0
UNIQUE          |1              |slideshowid,userid

TABLE|slideshow_usrgrp|slideshowusrgrpid|ZBX_DATA
FIELD           |slideshowusrgrpid|t_id         |       |NOT NULL       |0
FIELD           |slideshowid    |t_id           |       |NOT NULL       |0                      |1|slideshows
FIELD           |usrgrpid       |t_id           |       |NOT NULL       |0                      |2|usrgrp
FIELD           |permission     |t_integer      |'2'    |NOT NULL       |0
UNIQUE          |1              |slideshowid,usrgrpid

TABLE|slides|slideid|ZBX_DATA
FIELD           |slideid        |t_id           |       |NOT NULL       |0
FIELD           |slideshowid    |t_id           |       |NOT NULL       |0                      |1|slideshows
FIELD           |screenid       |t_id           |       |NOT NULL       |0                      |2|screens
FIELD           |step           |t_integer      |'0'    |NOT NULL       |0
FIELD           |delay          |t_varchar(32)  |'0'    |NOT NULL       |0
INDEX           |1              |slideshowid
INDEX           |2              |screenid

TABLE|drules|druleid|ZBX_DATA
FIELD           |druleid        |t_id           |       |NOT NULL       |0
FIELD           |proxy_hostid   |t_id           |       |NULL           |0                      |1|hosts        |hostid
|RESTRICT
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |iprange        |t_varchar(2048)|''     |NOT NULL       |ZBX_PROXY
FIELD           |delay          |t_varchar(255) |'1h'   |NOT NULL       |ZBX_PROXY
FIELD           |nextcheck      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |proxy_hostid
UNIQUE          |2              |name

TABLE|dchecks|dcheckid|ZBX_DATA
FIELD           |dcheckid       |t_id           |       |NOT NULL       |0
FIELD           |druleid        |t_id           |       |NOT NULL       |ZBX_PROXY              |1|drules
FIELD           |type           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |key_           |t_varchar(2048)|''     |NOT NULL       |ZBX_PROXY
FIELD           |snmp_community |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |ports          |t_varchar(255) |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |snmpv3_securityname|t_varchar(64)|''   |NOT NULL       |ZBX_PROXY
FIELD           |snmpv3_securitylevel|t_integer |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |snmpv3_authpassphrase|t_varchar(64)|'' |NOT NULL       |ZBX_PROXY
FIELD           |snmpv3_privpassphrase|t_varchar(64)|'' |NOT NULL       |ZBX_PROXY
FIELD           |uniq           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |snmpv3_authprotocol|t_integer  |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |snmpv3_privprotocol|t_integer  |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |snmpv3_contextname|t_varchar(255)|''   |NOT NULL       |ZBX_PROXY
FIELD           |host_source|t_integer  |'1'    |NOT NULL       |ZBX_PROXY
FIELD           |name_source|t_integer  |'0'    |NOT NULL       |ZBX_PROXY
INDEX           |1              |druleid,host_source,name_source

TABLE|applications|applicationid|ZBX_TEMPLATE
FIELD           |applicationid  |t_id           |       |NOT NULL       |0
FIELD           |hostid         |t_id           |       |NOT NULL       |0                      |1|hosts
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |flags          |t_integer      |'0'    |NOT NULL       |0
UNIQUE          |2              |hostid,name

TABLE|httptest|httptestid|ZBX_TEMPLATE
FIELD           |httptestid     |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |applicationid  |t_id           |       |NULL           |0                      |1|applications |                                                      |RESTRICT
FIELD           |nextcheck      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |delay          |t_varchar(255) |'1m'   |NOT NULL       |ZBX_PROXY
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |agent          |t_varchar(255) |'Zabbix'|NOT NULL      |ZBX_PROXY
FIELD           |authentication |t_integer      |'0'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |http_user      |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |http_password  |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |hostid         |t_id           |       |NOT NULL       |ZBX_PROXY              |2|hosts
FIELD           |templateid     |t_id           |       |NULL           |0                      |3|httptest     |httptestid
FIELD           |http_proxy     |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |retries        |t_integer      |'1'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |ssl_cert_file  |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |ssl_key_file   |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |ssl_key_password|t_varchar(64) |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |verify_peer    |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |verify_host    |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
INDEX           |1              |applicationid
UNIQUE          |2              |hostid,name
INDEX           |3              |status
INDEX           |4              |templateid

TABLE|httpstep|httpstepid|ZBX_TEMPLATE
FIELD           |httpstepid     |t_id           |       |NOT NULL       |0
FIELD           |httptestid     |t_id           |       |NOT NULL       |ZBX_PROXY              |1|httptest
FIELD           |name           |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |no             |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |url            |t_varchar(2048)|''     |NOT NULL       |ZBX_PROXY
FIELD           |timeout        |t_varchar(255) |'15s'  |NOT NULL       |ZBX_PROXY
FIELD           |posts          |t_shorttext    |''     |NOT NULL       |ZBX_PROXY
FIELD           |required       |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |status_codes   |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |follow_redirects|t_integer     |'1'    |NOT NULL       |ZBX_PROXY
FIELD           |retrieve_mode  |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |post_type      |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
INDEX           |1              |httptestid

TABLE|interface|interfaceid|ZBX_TEMPLATE
FIELD           |interfaceid    |t_id           |       |NOT NULL       |0
FIELD           |hostid         |t_id           |       |NOT NULL       |ZBX_PROXY              |1|hosts
FIELD           |main           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |type           |t_integer      |'1'    |NOT NULL       |ZBX_PROXY
FIELD           |useip          |t_integer      |'1'    |NOT NULL       |ZBX_PROXY
FIELD           |ip             |t_varchar(64)  |'127.0.0.1'|NOT NULL   |ZBX_PROXY
FIELD           |dns            |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |port           |t_varchar(64)  |'10050'|NOT NULL       |ZBX_PROXY
INDEX           |1              |hostid,type
INDEX           |2              |ip,dns

TABLE|valuemaps|valuemapid|ZBX_TEMPLATE
FIELD           |valuemapid     |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(64)  |''     |NOT NULL       |0
UNIQUE          |1              |name

TABLE|items|itemid|ZBX_TEMPLATE
FIELD           |itemid         |t_id           |       |NOT NULL       |0
FIELD           |type           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |snmp_oid       |t_varchar(512) |''     |NOT NULL       |ZBX_PROXY
FIELD           |hostid         |t_id           |       |NOT NULL       |ZBX_PROXY              |1|hosts
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |key_           |t_varchar(2048)|''     |NOT NULL       |ZBX_PROXY
FIELD           |delay          |t_varchar(1024)|'0'    |NOT NULL       |ZBX_PROXY
FIELD           |history        |t_varchar(255) |'90d'  |NOT NULL       |ZBX_PROXY
FIELD           |trends         |t_varchar(255) |'365d' |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |value_type     |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |trapper_hosts  |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |units          |t_varchar(255) |''     |NOT NULL       |0
FIELD           |formula        |t_varchar(255) |''     |NOT NULL       |0
FIELD           |logtimefmt     |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |templateid     |t_id           |       |NULL           |0                      |2|items        |itemid
FIELD           |valuemapid     |t_id           |       |NULL           |0                      |3|valuemaps    |                                                      |RESTRICT
FIELD           |params         |t_shorttext    |''     |NOT NULL       |ZBX_PROXY
FIELD           |ipmi_sensor    |t_varchar(128) |''     |NOT NULL       |ZBX_PROXY
FIELD           |authtype       |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |username       |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |password       |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |publickey      |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |privatekey     |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |flags          |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |interfaceid    |t_id           |       |NULL           |ZBX_PROXY              |4|interface    |                                                      |RESTRICT
FIELD           |description    |t_shorttext    |''     |NOT NULL       |0
FIELD           |inventory_link |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |lifetime       |t_varchar(255) |'30d'  |NOT NULL       |0
FIELD           |evaltype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |jmx_endpoint   |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |master_itemid  |t_id           |       |NULL           |ZBX_PROXY              |5|items        |itemid
FIELD           |timeout        |t_varchar(255) |'3s'   |NOT NULL       |ZBX_PROXY
FIELD           |url            |t_varchar(2048)|''     |NOT NULL       |ZBX_PROXY
FIELD           |query_fields   |t_varchar(2048)|''     |NOT NULL       |ZBX_PROXY
FIELD           |posts          |t_shorttext    |''     |NOT NULL       |ZBX_PROXY
FIELD           |status_codes   |t_varchar(255) |'200'  |NOT NULL       |ZBX_PROXY
FIELD           |follow_redirects|t_integer     |'1'    |NOT NULL       |ZBX_PROXY
FIELD           |post_type      |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |http_proxy     |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |headers        |t_shorttext    |''     |NOT NULL       |ZBX_PROXY
FIELD           |retrieve_mode  |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |request_method |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |output_format  |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |ssl_cert_file  |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |ssl_key_file   |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |ssl_key_password|t_varchar(64) |''     |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |verify_peer    |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |verify_host    |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |allow_traps    |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |discover       |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |hostid,key_(1021)
INDEX           |3              |status
INDEX           |4              |templateid
INDEX           |5              |valuemapid
INDEX           |6              |interfaceid
INDEX           |7              |master_itemid

TABLE|httpstepitem|httpstepitemid|ZBX_TEMPLATE
FIELD           |httpstepitemid |t_id           |       |NOT NULL       |0
FIELD           |httpstepid     |t_id           |       |NOT NULL       |ZBX_PROXY              |1|httpstep
FIELD           |itemid         |t_id           |       |NOT NULL       |ZBX_PROXY              |2|items
FIELD           |type           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
UNIQUE          |1              |httpstepid,itemid
INDEX           |2              |itemid

TABLE|httptestitem|httptestitemid|ZBX_TEMPLATE
FIELD           |httptestitemid |t_id           |       |NOT NULL       |0
FIELD           |httptestid     |t_id           |       |NOT NULL       |ZBX_PROXY              |1|httptest
FIELD           |itemid         |t_id           |       |NOT NULL       |ZBX_PROXY              |2|items
FIELD           |type           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
UNIQUE          |1              |httptestid,itemid
INDEX           |2              |itemid

TABLE|media_type|mediatypeid|ZBX_DATA
FIELD           |mediatypeid    |t_id           |       |NOT NULL       |0
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
FIELD           |name           |t_varchar(100) |''     |NOT NULL       |0
FIELD           |smtp_server    |t_varchar(255) |''     |NOT NULL       |0
FIELD           |smtp_helo      |t_varchar(255) |''     |NOT NULL       |0
FIELD           |smtp_email     |t_varchar(255) |''     |NOT NULL       |0
FIELD           |exec_path      |t_varchar(255) |''     |NOT NULL       |0
FIELD           |gsm_modem      |t_varchar(255) |''     |NOT NULL       |0
FIELD           |username       |t_varchar(255) |''     |NOT NULL       |0
FIELD           |passwd         |t_varchar(255) |''     |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |smtp_port      |t_integer      |'25'   |NOT NULL       |0
FIELD           |smtp_security  |t_integer      |'0'    |NOT NULL       |0
FIELD           |smtp_verify_peer|t_integer     |'0'    |NOT NULL       |0
FIELD           |smtp_verify_host|t_integer     |'0'    |NOT NULL       |0
FIELD           |smtp_authentication|t_integer  |'0'    |NOT NULL       |0
FIELD           |exec_params    |t_varchar(255) |''     |NOT NULL       |0
FIELD           |maxsessions    |t_integer      |'1'    |NOT NULL       |0
FIELD           |maxattempts    |t_integer      |'3'    |NOT NULL       |0
FIELD           |attempt_interval|t_varchar(32) |'10s'  |NOT NULL       |0
FIELD           |content_type   |t_integer      |'1'    |NOT NULL       |0
FIELD           |script         |t_text         |''     |NOT NULL       |0
FIELD           |timeout        |t_varchar(32)  |'30s'  |NOT NULL       |0
FIELD           |process_tags   |t_integer      |'0'    |NOT NULL       |0
FIELD           |show_event_menu|t_integer      |'0'    |NOT NULL       |0
FIELD           |event_menu_url |t_varchar(2048)|''     |NOT NULL       |0
FIELD           |event_menu_name|t_varchar(255) |''     |NOT NULL       |0
FIELD           |description    |t_shorttext    |''     |NOT NULL       |0
UNIQUE          |1              |name

TABLE|media_type_param|mediatype_paramid|ZBX_DATA
FIELD           |mediatype_paramid|t_id         |       |NOT NULL       |0
FIELD           |mediatypeid    |t_id           |       |NOT NULL       |0                      |1|media_type
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |value          |t_varchar(2048)|''     |NOT NULL       |0
INDEX           |1              |mediatypeid

TABLE|media_type_message|mediatype_messageid|ZBX_DATA
FIELD           |mediatype_messageid|t_id       |       |NOT NULL       |0
FIELD           |mediatypeid    |t_id           |       |NOT NULL       |0                      |1|media_type
FIELD           |eventsource    |t_integer      |       |NOT NULL       |0
FIELD           |recovery       |t_integer      |       |NOT NULL       |0
FIELD           |subject        |t_varchar(255) |''     |NOT NULL       |0
FIELD           |message        |t_shorttext    |''     |NOT NULL       |0
UNIQUE          |1              |mediatypeid,eventsource,recovery

TABLE|usrgrp|usrgrpid|ZBX_DATA
FIELD           |usrgrpid       |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |gui_access     |t_integer      |'0'    |NOT NULL       |0
FIELD           |users_status   |t_integer      |'0'    |NOT NULL       |0
FIELD           |debug_mode     |t_integer      |'0'    |NOT NULL       |0
UNIQUE          |1              |name

TABLE|users_groups|id|ZBX_DATA
FIELD           |id             |t_id           |       |NOT NULL       |0
FIELD           |usrgrpid       |t_id           |       |NOT NULL       |0                      |1|usrgrp
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |2|users
UNIQUE          |1              |usrgrpid,userid
INDEX           |2              |userid

TABLE|scripts|scriptid|ZBX_DATA
FIELD           |scriptid       |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |command        |t_varchar(255) |''     |NOT NULL       |0
FIELD           |host_access    |t_integer      |'2'    |NOT NULL       |0
FIELD           |usrgrpid       |t_id           |       |NULL           |0                      |1|usrgrp       |                                                      |RESTRICT
FIELD           |groupid        |t_id           |       |NULL           |0                      |2|hstgrp       |                                                      |RESTRICT
FIELD           |description    |t_shorttext    |''     |NOT NULL       |0
FIELD           |confirmation   |t_varchar(255) |''     |NOT NULL       |0
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
FIELD           |execute_on     |t_integer      |'2'    |NOT NULL       |0
INDEX           |1              |usrgrpid
INDEX           |2              |groupid
UNIQUE          |3              |name

TABLE|actions|actionid|ZBX_DATA
FIELD           |actionid       |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |eventsource    |t_integer      |'0'    |NOT NULL       |0
FIELD           |evaltype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |esc_period     |t_varchar(255) |'1h'   |NOT NULL       |0
FIELD           |formula        |t_varchar(255) |''     |NOT NULL       |0
FIELD           |pause_suppressed|t_integer     |'1'    |NOT NULL       |0
INDEX           |1              |eventsource,status
UNIQUE          |2              |name

TABLE|operations|operationid|ZBX_DATA
FIELD           |operationid    |t_id           |       |NOT NULL       |0
FIELD           |actionid       |t_id           |       |NOT NULL       |0                      |1|actions
FIELD           |operationtype  |t_integer      |'0'    |NOT NULL       |0
FIELD           |esc_period     |t_varchar(255) |'0'    |NOT NULL       |0
FIELD           |esc_step_from  |t_integer      |'1'    |NOT NULL       |0
FIELD           |esc_step_to    |t_integer      |'1'    |NOT NULL       |0
FIELD           |evaltype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |recovery       |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |actionid

TABLE|opmessage|operationid|ZBX_DATA
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |default_msg    |t_integer      |'1'    |NOT NULL       |0
FIELD           |subject        |t_varchar(255) |''     |NOT NULL       |0
FIELD           |message        |t_shorttext    |''     |NOT NULL       |0
FIELD           |mediatypeid    |t_id           |       |NULL           |0                      |2|media_type   |                                                      |RESTRICT
INDEX           |1              |mediatypeid

TABLE|opmessage_grp|opmessage_grpid|ZBX_DATA
FIELD           |opmessage_grpid|t_id           |       |NOT NULL       |0
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |usrgrpid       |t_id           |       |NOT NULL       |0                      |2|usrgrp       |                                                      |RESTRICT
UNIQUE          |1              |operationid,usrgrpid
INDEX           |2              |usrgrpid

TABLE|opmessage_usr|opmessage_usrid|ZBX_DATA
FIELD           |opmessage_usrid|t_id           |       |NOT NULL       |0
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |2|users        |                                                      |RESTRICT
UNIQUE          |1              |operationid,userid
INDEX           |2              |userid

TABLE|opcommand|operationid|ZBX_DATA
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
FIELD           |scriptid       |t_id           |       |NULL           |0                      |2|scripts      |                                                      |RESTRICT
FIELD           |execute_on     |t_integer      |'0'    |NOT NULL       |0
FIELD           |port           |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |authtype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |username       |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |password       |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |publickey      |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |privatekey     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |command        |t_shorttext    |''     |NOT NULL       |0
INDEX           |1              |scriptid

TABLE|opcommand_hst|opcommand_hstid|ZBX_DATA
FIELD           |opcommand_hstid|t_id           |       |NOT NULL       |0
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |hostid         |t_id           |       |NULL           |0                      |2|hosts        |                                                      |RESTRICT
INDEX           |1              |operationid
INDEX           |2              |hostid

TABLE|opcommand_grp|opcommand_grpid|ZBX_DATA
FIELD           |opcommand_grpid|t_id           |       |NOT NULL       |0
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |groupid        |t_id           |       |NOT NULL       |0                      |2|hstgrp       |                                                      |RESTRICT
INDEX           |1              |operationid
INDEX           |2              |groupid

TABLE|opgroup|opgroupid|ZBX_DATA
FIELD           |opgroupid      |t_id           |       |NOT NULL       |0
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |groupid        |t_id           |       |NOT NULL       |0                      |2|hstgrp       |                                                      |RESTRICT
UNIQUE          |1              |operationid,groupid
INDEX           |2              |groupid

TABLE|optemplate|optemplateid|ZBX_TEMPLATE
FIELD           |optemplateid   |t_id           |       |NOT NULL       |0
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |templateid     |t_id           |       |NOT NULL       |0                      |2|hosts        |hostid
|RESTRICT
UNIQUE          |1              |operationid,templateid
INDEX           |2              |templateid

TABLE|opconditions|opconditionid|ZBX_DATA
FIELD           |opconditionid  |t_id           |       |NOT NULL       |0
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |conditiontype  |t_integer      |'0'    |NOT NULL       |0
FIELD           |operator       |t_integer      |'0'    |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |operationid

TABLE|conditions|conditionid|ZBX_DATA
FIELD           |conditionid    |t_id           |       |NOT NULL       |0
FIELD           |actionid       |t_id           |       |NOT NULL       |0                      |1|actions
FIELD           |conditiontype  |t_integer      |'0'    |NOT NULL       |0
FIELD           |operator       |t_integer      |'0'    |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
FIELD           |value2         |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |actionid

TABLE|config|configid|ZBX_DATA
FIELD           |configid       |t_id           |       |NOT NULL       |0
FIELD           |refresh_unsupported|t_varchar(32)|'10m'        |NOT NULL       |ZBX_PROXY
FIELD           |work_period    |t_varchar(255) |'1-5,09:00-18:00'|NOT NULL|0
FIELD           |alert_usrgrpid |t_id           |       |NULL           |0                      |1|usrgrp       |usrgrpid                                              |RESTRICT
FIELD           |default_theme  |t_varchar(128) |'blue-theme'|NOT NULL  |ZBX_NODATA
FIELD           |authentication_type|t_integer  |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ldap_host      |t_varchar(255) |''     |NOT NULL       |ZBX_NODATA
FIELD           |ldap_port      |t_integer      |389    |NOT NULL       |ZBX_NODATA
FIELD           |ldap_base_dn   |t_varchar(255) |''     |NOT NULL       |ZBX_NODATA
FIELD           |ldap_bind_dn   |t_varchar(255) |''     |NOT NULL       |ZBX_NODATA
FIELD           |ldap_bind_password|t_varchar(128)|''   |NOT NULL       |ZBX_NODATA
FIELD           |ldap_search_attribute|t_varchar(128)|''|NOT NULL       |ZBX_NODATA
FIELD           |discovery_groupid|t_id         |       |NOT NULL       |ZBX_PROXY              |2|hstgrp       |groupid                                               |RESTRICT
FIELD           |max_in_table   |t_integer      |'50'   |NOT NULL       |ZBX_NODATA
FIELD           |search_limit   |t_integer      |'1000' |NOT NULL       |ZBX_NODATA
FIELD           |severity_color_0|t_varchar(6)  |'97AAB3'|NOT NULL      |ZBX_NODATA
FIELD           |severity_color_1|t_varchar(6)  |'7499FF'|NOT NULL      |ZBX_NODATA
FIELD           |severity_color_2|t_varchar(6)  |'FFC859'|NOT NULL      |ZBX_NODATA
FIELD           |severity_color_3|t_varchar(6)  |'FFA059'|NOT NULL      |ZBX_NODATA
FIELD           |severity_color_4|t_varchar(6)  |'E97659'|NOT NULL      |ZBX_NODATA
FIELD           |severity_color_5|t_varchar(6)  |'E45959'|NOT NULL      |ZBX_NODATA
FIELD           |severity_name_0|t_varchar(32)  |'Not classified'|NOT NULL|ZBX_NODATA
FIELD           |severity_name_1|t_varchar(32)  |'Information'|NOT NULL |ZBX_NODATA
FIELD           |severity_name_2|t_varchar(32)  |'Warning'|NOT NULL     |ZBX_NODATA
FIELD           |severity_name_3|t_varchar(32)  |'Average'|NOT NULL     |ZBX_NODATA
FIELD           |severity_name_4|t_varchar(32)  |'High' |NOT NULL       |ZBX_NODATA
FIELD           |severity_name_5|t_varchar(32)  |'Disaster'|NOT NULL    |ZBX_NODATA
FIELD           |ok_period      |t_varchar(32)  |'5m'   |NOT NULL       |ZBX_NODATA
FIELD           |blink_period   |t_varchar(32)  |'2m'   |NOT NULL       |ZBX_NODATA
FIELD           |problem_unack_color|t_varchar(6)|'CC0000'|NOT NULL     |ZBX_NODATA
FIELD           |problem_ack_color|t_varchar(6) |'CC0000'|NOT NULL      |ZBX_NODATA
FIELD           |ok_unack_color |t_varchar(6)   |'009900'|NOT NULL      |ZBX_NODATA
FIELD           |ok_ack_color   |t_varchar(6)   |'009900'|NOT NULL      |ZBX_NODATA
FIELD           |problem_unack_style|t_integer  |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |problem_ack_style|t_integer    |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |ok_unack_style |t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |ok_ack_style   |t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |snmptrap_logging|t_integer     |'1'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |server_check_interval|t_integer|'10'   |NOT NULL       |ZBX_NODATA
FIELD           |hk_events_mode |t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |hk_events_trigger|t_varchar(32)|'365d' |NOT NULL       |ZBX_NODATA
FIELD           |hk_events_internal|t_varchar(32)|'1d'  |NOT NULL       |ZBX_NODATA
FIELD           |hk_events_discovery|t_varchar(32)|'1d' |NOT NULL       |ZBX_NODATA
FIELD           |hk_events_autoreg|t_varchar(32)|'1d'   |NOT NULL       |ZBX_NODATA
FIELD           |hk_services_mode|t_integer     |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |hk_services    |t_varchar(32)  |'365d' |NOT NULL       |ZBX_NODATA
FIELD           |hk_audit_mode  |t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |hk_audit       |t_varchar(32)  |'365d' |NOT NULL       |ZBX_NODATA
FIELD           |hk_sessions_mode|t_integer     |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |hk_sessions    |t_varchar(32)  |'365d' |NOT NULL       |ZBX_NODATA
FIELD           |hk_history_mode|t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |hk_history_global|t_integer    |'0'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |hk_history     |t_varchar(32)  |'90d'  |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |hk_trends_mode |t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |hk_trends_global|t_integer     |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |hk_trends      |t_varchar(32)  |'365d' |NOT NULL       |ZBX_NODATA
FIELD           |default_inventory_mode|t_integer|'-1'  |NOT NULL       |ZBX_NODATA
FIELD           |custom_color   |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |http_auth_enabled      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |http_login_form        |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |http_strip_domains     |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |http_case_sensitive    |t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |ldap_configured                |t_integer              |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ldap_case_sensitive    |t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |db_extension   |t_varchar(32)  |''     |NOT NULL       |ZBX_NODATA
FIELD           |autoreg_tls_accept     |t_integer      |'1'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |compression_status     |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |compression_availability       |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |compress_older |t_varchar(32)  |'7d'   |NOT NULL       |ZBX_NODATA
FIELD           |instanceid     |t_varchar(32)  |''     |NOT NULL       |ZBX_NODATA
FIELD           |saml_auth_enabled      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |saml_idp_entityid      |t_varchar(1024)|''     |NOT NULL       |ZBX_NODATA
FIELD           |saml_sso_url   |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |saml_slo_url   |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |saml_username_attribute|t_varchar(128) |''     |NOT NULL       |ZBX_NODATA
FIELD           |saml_sp_entityid       |t_varchar(1024)|''     |NOT NULL       |ZBX_NODATA
FIELD           |saml_nameid_format     |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |saml_sign_messages     |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |saml_sign_assertions   |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |saml_sign_authn_requests       |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |saml_sign_logout_requests      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |saml_sign_logout_responses     |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |saml_encrypt_nameid    |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |saml_encrypt_assertions|t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |saml_case_sensitive    |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |default_lang           |t_varchar(5)   |'en_GB'|NOT NULL       |ZBX_NODATA
FIELD           |default_timezone       |t_varchar(50)  |'system'|NOT NULL      |ZBX_NODATA
FIELD           |login_attempts |t_integer      |'5'    |NOT NULL       |ZBX_NODATA
FIELD           |login_block    |t_varchar(32)  |'30s'  |NOT NULL       |ZBX_NODATA
FIELD           |show_technical_errors  |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |validate_uri_schemes   |t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |uri_valid_schemes      |t_varchar(255) |'http,https,ftp,file,mailto,tel,ssh'   |NOT NULL       |ZBX_NODATA
FIELD           |x_frame_options        |t_varchar(255) |'SAMEORIGIN'   |NOT NULL       |ZBX_NODATA
FIELD           |iframe_sandboxing_enabled      |t_integer      |'1'    |NOT NULL       |ZBX_NODATA
FIELD           |iframe_sandboxing_exceptions   |t_varchar(255) |''     |NOT NULL       |ZBX_NODATA
FIELD           |max_overview_table_size        |t_integer      |'50'   |NOT NULL       |ZBX_NODATA
FIELD           |history_period |t_varchar(32)| '24h'   |NOT NULL       |ZBX_NODATA
FIELD           |period_default |t_varchar(32)  |'1h'   |NOT NULL       |ZBX_NODATA
FIELD           |max_period     |t_varchar(32)  |'2y'   |NOT NULL       |ZBX_NODATA
FIELD           |socket_timeout |t_varchar(32)  |'3s'   |NOT NULL       |ZBX_NODATA
FIELD           |connect_timeout        |t_varchar(32)  |'3s'   |NOT NULL       |ZBX_NODATA
FIELD           |media_type_test_timeout        |t_varchar(32)  |'65s'  |NOT NULL       |ZBX_NODATA
FIELD           |script_timeout |t_varchar(32)  |'60s'  |NOT NULL       |ZBX_NODATA
FIELD           |item_test_timeout      |t_varchar(32)  |'60s'  |NOT NULL       |ZBX_NODATA
FIELD           |session_key    |t_varchar(32)|''       |NOT NULL       |ZBX_NODATA
INDEX           |1              |alert_usrgrpid
INDEX           |2              |discovery_groupid

TABLE|triggers|triggerid|ZBX_TEMPLATE
FIELD           |triggerid      |t_id           |       |NOT NULL       |0
FIELD           |expression     |t_varchar(2048)|''     |NOT NULL       |0
FIELD           |description    |t_varchar(255) |''     |NOT NULL       |0
FIELD           |url            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |value          |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |priority       |t_integer      |'0'    |NOT NULL       |0
FIELD           |lastchange     |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |comments       |t_shorttext    |''     |NOT NULL       |0
FIELD           |error          |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |templateid     |t_id           |       |NULL           |0                      |1|triggers     |triggerid
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
FIELD           |state          |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |flags          |t_integer      |'0'    |NOT NULL       |0
FIELD           |recovery_mode  |t_integer      |'0'    |NOT NULL       |0
FIELD           |recovery_expression|t_varchar(2048)|'' |NOT NULL       |0
FIELD           |correlation_mode|t_integer     |'0'    |NOT NULL       |0
FIELD           |correlation_tag|t_varchar(255) |''     |NOT NULL       |0
FIELD           |manual_close   |t_integer      |'0'    |NOT NULL       |0
FIELD           |opdata         |t_varchar(255) |''     |NOT NULL       |0
FIELD           |discover       |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |status
INDEX           |2              |value,lastchange
INDEX           |3              |templateid

TABLE|trigger_depends|triggerdepid|ZBX_TEMPLATE
FIELD           |triggerdepid   |t_id           |       |NOT NULL       |0
FIELD           |triggerid_down |t_id           |       |NOT NULL       |0                      |1|triggers     |triggerid
FIELD           |triggerid_up   |t_id           |       |NOT NULL       |0                      |2|triggers     |triggerid
UNIQUE          |1              |triggerid_down,triggerid_up
INDEX           |2              |triggerid_up

TABLE|functions|functionid|ZBX_TEMPLATE
FIELD           |functionid     |t_id           |       |NOT NULL       |0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |1|items
FIELD           |triggerid      |t_id           |       |NOT NULL       |0                      |2|triggers
FIELD           |name           |t_varchar(12)  |''     |NOT NULL       |0
FIELD           |parameter      |t_varchar(255) |'0'    |NOT NULL       |0
INDEX           |1              |triggerid
INDEX           |2              |itemid,name,parameter

TABLE|graphs|graphid|ZBX_TEMPLATE
FIELD           |graphid        |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(128) |''     |NOT NULL       |0
FIELD           |width          |t_integer      |'900'  |NOT NULL       |0
FIELD           |height         |t_integer      |'200'  |NOT NULL       |0
FIELD           |yaxismin       |t_double       |'0'    |NOT NULL       |0
FIELD           |yaxismax       |t_double       |'100'  |NOT NULL       |0
FIELD           |templateid     |t_id           |       |NULL           |0                      |1|graphs       |graphid
FIELD           |show_work_period|t_integer     |'1'    |NOT NULL       |0
FIELD           |show_triggers  |t_integer      |'1'    |NOT NULL       |0
FIELD           |graphtype      |t_integer      |'0'    |NOT NULL       |0
FIELD           |show_legend    |t_integer      |'1'    |NOT NULL       |0
FIELD           |show_3d        |t_integer      |'0'    |NOT NULL       |0
FIELD           |percent_left   |t_double       |'0'    |NOT NULL       |0
FIELD           |percent_right  |t_double       |'0'    |NOT NULL       |0
FIELD           |ymin_type      |t_integer      |'0'    |NOT NULL       |0
FIELD           |ymax_type      |t_integer      |'0'    |NOT NULL       |0
FIELD           |ymin_itemid    |t_id           |       |NULL           |0                      |2|items        |itemid
|RESTRICT
FIELD           |ymax_itemid    |t_id           |       |NULL           |0                      |3|items        |itemid
|RESTRICT
FIELD           |flags          |t_integer      |'0'    |NOT NULL       |0
FIELD           |discover       |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |name
INDEX           |2              |templateid
INDEX           |3              |ymin_itemid
INDEX           |4              |ymax_itemid

TABLE|graphs_items|gitemid|ZBX_TEMPLATE
FIELD           |gitemid        |t_id           |       |NOT NULL       |0
FIELD           |graphid        |t_id           |       |NOT NULL       |0                      |1|graphs
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |2|items
FIELD           |drawtype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |sortorder      |t_integer      |'0'    |NOT NULL       |0
FIELD           |color          |t_varchar(6)   |'009600'|NOT NULL      |0
FIELD           |yaxisside      |t_integer      |'0'    |NOT NULL       |0
FIELD           |calc_fnc       |t_integer      |'2'    |NOT NULL       |0
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |itemid
INDEX           |2              |graphid

TABLE|graph_theme|graphthemeid|ZBX_DATA
FIELD           |graphthemeid   |t_id           |       |NOT NULL       |0
FIELD           |theme          |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |backgroundcolor|t_varchar(6)   |''     |NOT NULL       |0
FIELD           |graphcolor     |t_varchar(6)   |''     |NOT NULL       |0
FIELD           |gridcolor      |t_varchar(6)   |''     |NOT NULL       |0
FIELD           |maingridcolor  |t_varchar(6)   |''     |NOT NULL       |0
FIELD           |gridbordercolor|t_varchar(6)   |''     |NOT NULL       |0
FIELD           |textcolor      |t_varchar(6)   |''     |NOT NULL       |0
FIELD           |highlightcolor |t_varchar(6)   |''     |NOT NULL       |0
FIELD           |leftpercentilecolor|t_varchar(6)|''    |NOT NULL       |0
FIELD           |rightpercentilecolor|t_varchar(6)|''   |NOT NULL       |0
FIELD           |nonworktimecolor|t_varchar(6)  |''     |NOT NULL       |0
FIELD           |colorpalette   |t_varchar(255) |''     |NOT NULL       |0
UNIQUE          |1              |theme

TABLE|globalmacro|globalmacroid|ZBX_DATA
FIELD           |globalmacroid  |t_id           |       |NOT NULL       |0
FIELD           |macro          |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |value          |t_varchar(2048)|''     |NOT NULL       |ZBX_PROXY
FIELD           |description    |t_shorttext    |''     |NOT NULL       |0
FIELD           |type           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
UNIQUE          |1              |macro

TABLE|hostmacro|hostmacroid|ZBX_TEMPLATE
FIELD           |hostmacroid    |t_id           |       |NOT NULL       |0
FIELD           |hostid         |t_id           |       |NOT NULL       |ZBX_PROXY              |1|hosts
FIELD           |macro          |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |value          |t_varchar(2048)|''     |NOT NULL       |ZBX_PROXY
FIELD           |description    |t_shorttext    |''     |NOT NULL       |0
FIELD           |type           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
UNIQUE          |1              |hostid,macro

TABLE|hosts_groups|hostgroupid|ZBX_TEMPLATE
FIELD           |hostgroupid    |t_id           |       |NOT NULL       |0
FIELD           |hostid         |t_id           |       |NOT NULL       |0                      |1|hosts
FIELD           |groupid        |t_id           |       |NOT NULL       |0                      |2|hstgrp
UNIQUE          |1              |hostid,groupid
INDEX           |2              |groupid

TABLE|hosts_templates|hosttemplateid|ZBX_TEMPLATE
FIELD           |hosttemplateid |t_id           |       |NOT NULL       |0
FIELD           |hostid         |t_id           |       |NOT NULL       |ZBX_PROXY              |1|hosts
FIELD           |templateid     |t_id           |       |NOT NULL       |ZBX_PROXY              |2|hosts        |hostid
UNIQUE          |1              |hostid,templateid
INDEX           |2              |templateid

TABLE|items_applications|itemappid|ZBX_TEMPLATE
FIELD           |itemappid      |t_id           |       |NOT NULL       |0
FIELD           |applicationid  |t_id           |       |NOT NULL       |0                      |1|applications
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |2|items
UNIQUE          |1              |applicationid,itemid
INDEX           |2              |itemid

TABLE|mappings|mappingid|ZBX_TEMPLATE
FIELD           |mappingid      |t_id           |       |NOT NULL       |0
FIELD           |valuemapid     |t_id           |       |NOT NULL       |0                      |1|valuemaps
FIELD           |value          |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |newvalue       |t_varchar(64)  |''     |NOT NULL       |0
INDEX           |1              |valuemapid

TABLE|media|mediaid|ZBX_DATA
FIELD           |mediaid        |t_id           |       |NOT NULL       |0
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |1|users
FIELD           |mediatypeid    |t_id           |       |NOT NULL       |0                      |2|media_type
FIELD           |sendto         |t_varchar(1024)|''     |NOT NULL       |0
FIELD           |active         |t_integer      |'0'    |NOT NULL       |0
FIELD           |severity       |t_integer      |'63'   |NOT NULL       |0
FIELD           |period         |t_varchar(1024)|'1-7,00:00-24:00'|NOT NULL|0
INDEX           |1              |userid
INDEX           |2              |mediatypeid

TABLE|rights|rightid|ZBX_DATA
FIELD           |rightid        |t_id           |       |NOT NULL       |0
FIELD           |groupid        |t_id           |       |NOT NULL       |0                      |1|usrgrp       |usrgrpid
FIELD           |permission     |t_integer      |'0'    |NOT NULL       |0
FIELD           |id             |t_id           |       |NOT NULL       |0                      |2|hstgrp       |groupid
INDEX           |1              |groupid
INDEX           |2              |id

TABLE|services|serviceid|ZBX_DATA
FIELD           |serviceid      |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(128) |''     |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |algorithm      |t_integer      |'0'    |NOT NULL       |0
FIELD           |triggerid      |t_id           |       |NULL           |0                      |1|triggers
FIELD           |showsla        |t_integer      |'0'    |NOT NULL       |0
FIELD           |goodsla        |t_double       |'99.9' |NOT NULL       |0
FIELD           |sortorder      |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |triggerid

TABLE|services_links|linkid|ZBX_DATA
FIELD           |linkid         |t_id           |       |NOT NULL       |0
FIELD           |serviceupid    |t_id           |       |NOT NULL       |0                      |1|services     |serviceid
FIELD           |servicedownid  |t_id           |       |NOT NULL       |0                      |2|services     |serviceid
FIELD           |soft           |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |servicedownid
UNIQUE          |2              |serviceupid,servicedownid

TABLE|services_times|timeid|ZBX_DATA
FIELD           |timeid         |t_id           |       |NOT NULL       |0
FIELD           |serviceid      |t_id           |       |NOT NULL       |0                      |1|services
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
FIELD           |ts_from        |t_integer      |'0'    |NOT NULL       |0
FIELD           |ts_to          |t_integer      |'0'    |NOT NULL       |0
FIELD           |note           |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |serviceid,type,ts_from,ts_to

TABLE|icon_map|iconmapid|ZBX_DATA
FIELD           |iconmapid      |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |default_iconid |t_id           |       |NOT NULL       |0                      |1|images       |imageid                                               |RESTRICT
UNIQUE          |1              |name
INDEX           |2              |default_iconid

TABLE|icon_mapping|iconmappingid|ZBX_DATA
FIELD           |iconmappingid  |t_id           |       |NOT NULL       |0
FIELD           |iconmapid      |t_id           |       |NOT NULL       |0                      |1|icon_map
FIELD           |iconid         |t_id           |       |NOT NULL       |0                      |2|images       |imageid                                               |RESTRICT
FIELD           |inventory_link |t_integer      |'0'    |NOT NULL       |0
FIELD           |expression     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |sortorder      |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |iconmapid
INDEX           |2              |iconid

TABLE|sysmaps|sysmapid|ZBX_TEMPLATE
FIELD           |sysmapid       |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(128) |''     |NOT NULL       |0
FIELD           |width          |t_integer      |'600'  |NOT NULL       |0
FIELD           |height         |t_integer      |'400'  |NOT NULL       |0
FIELD           |backgroundid   |t_id           |       |NULL           |0                      |1|images       |imageid                                               |RESTRICT
FIELD           |label_type     |t_integer      |'2'    |NOT NULL       |0
FIELD           |label_location |t_integer      |'0'    |NOT NULL       |0
FIELD           |highlight      |t_integer      |'1'    |NOT NULL       |0
FIELD           |expandproblem  |t_integer      |'1'    |NOT NULL       |0
FIELD           |markelements   |t_integer      |'0'    |NOT NULL       |0
FIELD           |show_unack     |t_integer      |'0'    |NOT NULL       |0
FIELD           |grid_size      |t_integer      |'50'   |NOT NULL       |0
FIELD           |grid_show      |t_integer      |'1'    |NOT NULL       |0
FIELD           |grid_align     |t_integer      |'1'    |NOT NULL       |0
FIELD           |label_format   |t_integer      |'0'    |NOT NULL       |0
FIELD           |label_type_host|t_integer      |'2'    |NOT NULL       |0
FIELD           |label_type_hostgroup|t_integer |'2'    |NOT NULL       |0
FIELD           |label_type_trigger|t_integer   |'2'    |NOT NULL       |0
FIELD           |label_type_map|t_integer       |'2'    |NOT NULL       |0
FIELD           |label_type_image|t_integer     |'2'    |NOT NULL       |0
FIELD           |label_string_host|t_varchar(255)|''    |NOT NULL       |0
FIELD           |label_string_hostgroup|t_varchar(255)|''|NOT NULL      |0
FIELD           |label_string_trigger|t_varchar(255)|'' |NOT NULL       |0
FIELD           |label_string_map|t_varchar(255)|''     |NOT NULL       |0
FIELD           |label_string_image|t_varchar(255)|''   |NOT NULL       |0
FIELD           |iconmapid      |t_id           |       |NULL           |0                      |2|icon_map     |                                                      |RESTRICT
FIELD           |expand_macros  |t_integer      |'0'    |NOT NULL       |0
FIELD           |severity_min   |t_integer      |'0'    |NOT NULL       |0
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |3|users        |                                                      |RESTRICT
FIELD           |private        |t_integer      |'1'    |NOT NULL       |0
FIELD           |show_suppressed|t_integer      |'0'    |NOT NULL       |0
UNIQUE          |1              |name
INDEX           |2              |backgroundid
INDEX           |3              |iconmapid

TABLE|sysmaps_elements|selementid|ZBX_TEMPLATE
FIELD           |selementid     |t_id           |       |NOT NULL       |0
FIELD           |sysmapid       |t_id           |       |NOT NULL       |0                      |1|sysmaps
FIELD           |elementid      |t_id           |'0'    |NOT NULL       |0
FIELD           |elementtype    |t_integer      |'0'    |NOT NULL       |0
FIELD           |iconid_off     |t_id           |       |NULL           |0                      |2|images       |imageid                                               |RESTRICT
FIELD           |iconid_on      |t_id           |       |NULL           |0                      |3|images       |imageid                                               |RESTRICT
FIELD           |label          |t_varchar(2048)|''     |NOT NULL       |0
FIELD           |label_location |t_integer      |'-1'   |NOT NULL       |0
FIELD           |x              |t_integer      |'0'    |NOT NULL       |0
FIELD           |y              |t_integer      |'0'    |NOT NULL       |0
FIELD           |iconid_disabled|t_id           |       |NULL           |0                      |4|images       |imageid                                               |RESTRICT
FIELD           |iconid_maintenance|t_id        |       |NULL           |0                      |5|images       |imageid                                               |RESTRICT
FIELD           |elementsubtype |t_integer      |'0'    |NOT NULL       |0
FIELD           |areatype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |width          |t_integer      |'200'  |NOT NULL       |0
FIELD           |height         |t_integer      |'200'  |NOT NULL       |0
FIELD           |viewtype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |use_iconmap    |t_integer      |'1'    |NOT NULL       |0
FIELD           |application    |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |sysmapid
INDEX           |2              |iconid_off
INDEX           |3              |iconid_on
INDEX           |4              |iconid_disabled
INDEX           |5              |iconid_maintenance

TABLE|sysmaps_links|linkid|ZBX_TEMPLATE
FIELD           |linkid         |t_id           |       |NOT NULL       |0
FIELD           |sysmapid       |t_id           |       |NOT NULL       |0                      |1|sysmaps
FIELD           |selementid1    |t_id           |       |NOT NULL       |0                      |2|sysmaps_elements|selementid
FIELD           |selementid2    |t_id           |       |NOT NULL       |0                      |3|sysmaps_elements|selementid
FIELD           |drawtype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |color          |t_varchar(6)   |'000000'|NOT NULL      |0
FIELD           |label          |t_varchar(2048)|''     |NOT NULL       |0
INDEX           |1              |sysmapid
INDEX           |2              |selementid1
INDEX           |3              |selementid2

TABLE|sysmaps_link_triggers|linktriggerid|ZBX_TEMPLATE
FIELD           |linktriggerid  |t_id           |       |NOT NULL       |0
FIELD           |linkid         |t_id           |       |NOT NULL       |0                      |1|sysmaps_links
FIELD           |triggerid      |t_id           |       |NOT NULL       |0                      |2|triggers
FIELD           |drawtype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |color          |t_varchar(6)   |'000000'|NOT NULL      |0
UNIQUE          |1              |linkid,triggerid
INDEX           |2              |triggerid

TABLE|sysmap_element_url|sysmapelementurlid|ZBX_TEMPLATE
FIELD           |sysmapelementurlid|t_id        |       |NOT NULL       |0
FIELD           |selementid     |t_id           |       |NOT NULL       |0                      |1|sysmaps_elements
FIELD           |name           |t_varchar(255) |       |NOT NULL       |0
FIELD           |url            |t_varchar(255) |''     |NOT NULL       |0
UNIQUE          |1              |selementid,name

TABLE|sysmap_url|sysmapurlid|ZBX_TEMPLATE
FIELD           |sysmapurlid    |t_id           |       |NOT NULL       |0
FIELD           |sysmapid       |t_id           |       |NOT NULL       |0                      |1|sysmaps
FIELD           |name           |t_varchar(255) |       |NOT NULL       |0
FIELD           |url            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |elementtype    |t_integer      |'0'    |NOT NULL       |0
UNIQUE          |1              |sysmapid,name

TABLE|sysmap_user|sysmapuserid|ZBX_TEMPLATE
FIELD           |sysmapuserid|t_id              |       |NOT NULL       |0
FIELD           |sysmapid       |t_id           |       |NOT NULL       |0                      |1|sysmaps
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |2|users
FIELD           |permission     |t_integer      |'2'    |NOT NULL       |0
UNIQUE          |1              |sysmapid,userid

TABLE|sysmap_usrgrp|sysmapusrgrpid|ZBX_TEMPLATE
FIELD           |sysmapusrgrpid|t_id            |       |NOT NULL       |0
FIELD           |sysmapid       |t_id           |       |NOT NULL       |0                      |1|sysmaps
FIELD           |usrgrpid       |t_id           |       |NOT NULL       |0                      |2|usrgrp
FIELD           |permission     |t_integer      |'2'    |NOT NULL       |0
UNIQUE          |1              |sysmapid,usrgrpid

TABLE|maintenances_hosts|maintenance_hostid|ZBX_DATA
FIELD           |maintenance_hostid|t_id        |       |NOT NULL       |0
FIELD           |maintenanceid  |t_id           |       |NOT NULL       |0                      |1|maintenances
FIELD           |hostid         |t_id           |       |NOT NULL       |0                      |2|hosts
UNIQUE          |1              |maintenanceid,hostid
INDEX           |2              |hostid

TABLE|maintenances_groups|maintenance_groupid|ZBX_DATA
FIELD           |maintenance_groupid|t_id       |       |NOT NULL       |0
FIELD           |maintenanceid  |t_id           |       |NOT NULL       |0                      |1|maintenances
FIELD           |groupid        |t_id           |       |NOT NULL       |0                      |2|hstgrp
UNIQUE          |1              |maintenanceid,groupid
INDEX           |2              |groupid

TABLE|timeperiods|timeperiodid|ZBX_DATA
FIELD           |timeperiodid   |t_id           |       |NOT NULL       |0
FIELD           |timeperiod_type|t_integer      |'0'    |NOT NULL       |0
FIELD           |every          |t_integer      |'1'    |NOT NULL       |0
FIELD           |month          |t_integer      |'0'    |NOT NULL       |0
FIELD           |dayofweek      |t_integer      |'0'    |NOT NULL       |0
FIELD           |day            |t_integer      |'0'    |NOT NULL       |0
FIELD           |start_time     |t_integer      |'0'    |NOT NULL       |0
FIELD           |period         |t_integer      |'0'    |NOT NULL       |0
FIELD           |start_date     |t_integer      |'0'    |NOT NULL       |0

TABLE|maintenances_windows|maintenance_timeperiodid|ZBX_DATA
FIELD           |maintenance_timeperiodid|t_id  |       |NOT NULL       |0
FIELD           |maintenanceid  |t_id           |       |NOT NULL       |0                      |1|maintenances
FIELD           |timeperiodid   |t_id           |       |NOT NULL       |0                      |2|timeperiods
UNIQUE          |1              |maintenanceid,timeperiodid
INDEX           |2              |timeperiodid

TABLE|regexps|regexpid|ZBX_DATA
FIELD           |regexpid       |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(128) |''     |NOT NULL       |ZBX_PROXY
FIELD           |test_string    |t_shorttext    |''     |NOT NULL       |0
UNIQUE          |1              |name

TABLE|expressions|expressionid|ZBX_DATA
FIELD           |expressionid   |t_id           |       |NOT NULL       |0
FIELD           |regexpid       |t_id           |       |NOT NULL       |ZBX_PROXY              |1|regexps
FIELD           |expression     |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |expression_type|t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |exp_delimiter  |t_varchar(1)   |''     |NOT NULL       |ZBX_PROXY
FIELD           |case_sensitive |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
INDEX           |1              |regexpid

TABLE|ids|table_name,field_name|0
FIELD           |table_name     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |field_name     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |nextid         |t_id           |       |NOT NULL       |0

-- History tables

TABLE|alerts|alertid|0
FIELD           |alertid        |t_id           |       |NOT NULL       |0
FIELD           |actionid       |t_id           |       |NOT NULL       |0                      |1|actions
FIELD           |eventid        |t_id           |       |NOT NULL       |0                      |2|events
FIELD           |userid         |t_id           |       |NULL           |0                      |3|users
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |mediatypeid    |t_id           |       |NULL           |0                      |4|media_type
FIELD           |sendto         |t_varchar(1024)|''     |NOT NULL       |0
FIELD           |subject        |t_varchar(255) |''     |NOT NULL       |0
FIELD           |message        |t_text         |''     |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |retries        |t_integer      |'0'    |NOT NULL       |0
FIELD           |error          |t_varchar(2048)|''     |NOT NULL       |0
FIELD           |esc_step       |t_integer      |'0'    |NOT NULL       |0
FIELD           |alerttype      |t_integer      |'0'    |NOT NULL       |0
FIELD           |p_eventid      |t_id           |       |NULL           |0                      |5|events       |eventid
FIELD           |acknowledgeid  |t_id           |       |NULL           |0                      |6|acknowledges |acknowledgeid
FIELD           |parameters     |t_shorttext    |'{}'   |NOT NULL       |0
INDEX           |1              |actionid
INDEX           |2              |clock
INDEX           |3              |eventid
INDEX           |4              |status
INDEX           |5              |mediatypeid
INDEX           |6              |userid
INDEX           |7              |p_eventid

TABLE|history||0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |-|items
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |value          |t_double       |'0.0000'|NOT NULL      |0
FIELD           |ns             |t_nanosec      |'0'    |NOT NULL       |0
INDEX           |1              |itemid,clock

TABLE|history_uint||0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |-|items
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |value          |t_bigint       |'0'    |NOT NULL       |0
FIELD           |ns             |t_nanosec      |'0'    |NOT NULL       |0
INDEX           |1              |itemid,clock

TABLE|history_str||0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |-|items
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
FIELD           |ns             |t_nanosec      |'0'    |NOT NULL       |0
INDEX           |1              |itemid,clock

TABLE|history_log||0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |-|items
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |timestamp      |t_time         |'0'    |NOT NULL       |0
FIELD           |source         |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |severity       |t_integer      |'0'    |NOT NULL       |0
FIELD           |value          |t_text         |''     |NOT NULL       |0
FIELD           |logeventid     |t_integer      |'0'    |NOT NULL       |0
FIELD           |ns             |t_nanosec      |'0'    |NOT NULL       |0
INDEX           |1              |itemid,clock

TABLE|history_text||0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |-|items
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |value          |t_text         |''     |NOT NULL       |0
FIELD           |ns             |t_nanosec      |'0'    |NOT NULL       |0
INDEX           |1              |itemid,clock

TABLE|proxy_history|id|0
FIELD           |id             |t_serial       |       |NOT NULL       |0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |-|items
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |timestamp      |t_time         |'0'    |NOT NULL       |0
FIELD           |source         |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |severity       |t_integer      |'0'    |NOT NULL       |0
FIELD           |value          |t_longtext     |''     |NOT NULL       |0
FIELD           |logeventid     |t_integer      |'0'    |NOT NULL       |0
FIELD           |ns             |t_nanosec      |'0'    |NOT NULL       |0
FIELD           |state          |t_integer      |'0'    |NOT NULL       |0
FIELD           |lastlogsize    |t_bigint       |'0'    |NOT NULL       |0
FIELD           |mtime          |t_integer      |'0'    |NOT NULL       |0
FIELD           |flags          |t_integer      |'0'    |NOT NULL       |0
FIELD           |write_clock    |t_time         |'0'    |NOT NULL       |0
INDEX           |1              |clock

TABLE|proxy_dhistory|id|0
FIELD           |id             |t_serial       |       |NOT NULL       |0
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |druleid        |t_id           |       |NOT NULL       |0                      |-|drules
FIELD           |ip             |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |port           |t_integer      |'0'    |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |dcheckid       |t_id           |       |NULL           |0                      |-|dchecks
FIELD           |dns            |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |clock
INDEX           |2              |druleid

TABLE|events|eventid|0
FIELD           |eventid        |t_id           |       |NOT NULL       |0
FIELD           |source         |t_integer      |'0'    |NOT NULL       |0
FIELD           |object         |t_integer      |'0'    |NOT NULL       |0
FIELD           |objectid       |t_id           |'0'    |NOT NULL       |0
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |value          |t_integer      |'0'    |NOT NULL       |0
FIELD           |acknowledged   |t_integer      |'0'    |NOT NULL       |0
FIELD           |ns             |t_nanosec      |'0'    |NOT NULL       |0
FIELD           |name           |t_varchar(2048)|''     |NOT NULL       |0
FIELD           |severity       |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |source,object,objectid,clock
INDEX           |2              |source,object,clock

TABLE|trends|itemid,clock|0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |-|items
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |num            |t_integer      |'0'    |NOT NULL       |0
FIELD           |value_min      |t_double       |'0.0000'|NOT NULL      |0
FIELD           |value_avg      |t_double       |'0.0000'|NOT NULL      |0
FIELD           |value_max      |t_double       |'0.0000'|NOT NULL      |0

TABLE|trends_uint|itemid,clock|0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |-|items
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |num            |t_integer      |'0'    |NOT NULL       |0
FIELD           |value_min      |t_bigint       |'0'    |NOT NULL       |0
FIELD           |value_avg      |t_bigint       |'0'    |NOT NULL       |0
FIELD           |value_max      |t_bigint       |'0'    |NOT NULL       |0

TABLE|acknowledges|acknowledgeid|0
FIELD           |acknowledgeid  |t_id           |       |NOT NULL       |0
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |1|users
FIELD           |eventid        |t_id           |       |NOT NULL       |0                      |2|events
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |message        |t_varchar(2048)|''     |NOT NULL       |0
FIELD           |action         |t_integer      |'0'    |NOT NULL       |0
FIELD           |old_severity   |t_integer      |'0'    |NOT NULL       |0
FIELD           |new_severity   |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |userid
INDEX           |2              |eventid
INDEX           |3              |clock

TABLE|auditlog|auditid|0
FIELD           |auditid        |t_id           |       |NOT NULL       |0
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |1|users
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |action         |t_integer      |'0'    |NOT NULL       |0
FIELD           |resourcetype   |t_integer      |'0'    |NOT NULL       |0
FIELD           |note           |t_varchar(128) |''     |NOT NULL       |0
FIELD           |ip             |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |resourceid     |t_id           |       |NULL           |0
FIELD           |resourcename   |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |userid,clock
INDEX           |2              |clock
INDEX           |3              |resourcetype,resourceid

TABLE|auditlog_details|auditdetailid|0
FIELD           |auditdetailid  |t_id           |       |NOT NULL       |0
FIELD           |auditid        |t_id           |       |NOT NULL       |0                      |1|auditlog
FIELD           |table_name     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |field_name     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |oldvalue       |t_text         |''     |NOT NULL       |0
FIELD           |newvalue       |t_text         |''     |NOT NULL       |0
INDEX           |1              |auditid

TABLE|service_alarms|servicealarmid|0
FIELD           |servicealarmid |t_id           |       |NOT NULL       |0
FIELD           |serviceid      |t_id           |       |NOT NULL       |0                      |1|services
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |value          |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |serviceid,clock
INDEX           |2              |clock

TABLE|autoreg_host|autoreg_hostid|0
FIELD           |autoreg_hostid |t_id           |       |NOT NULL       |0
FIELD           |proxy_hostid   |t_id           |       |NULL           |0                      |1|hosts        |hostid
FIELD           |host           |t_varchar(128) |''     |NOT NULL       |0
FIELD           |listen_ip      |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |listen_port    |t_integer      |'0'    |NOT NULL       |0
FIELD           |listen_dns     |t_varchar(255) |''     |NOT NULL       |0
FIELD           |host_metadata  |t_varchar(255) |''     |NOT NULL       |0
FIELD           |flags          |t_integer      |'0'    |NOT NULL       |0
FIELD           |tls_accepted   |t_integer      |'1'    |NOT NULL       |0
INDEX           |1              |host
INDEX           |2              |proxy_hostid

TABLE|proxy_autoreg_host|id|0
FIELD           |id             |t_serial       |       |NOT NULL       |0
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |host           |t_varchar(128) |''     |NOT NULL       |0
FIELD           |listen_ip      |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |listen_port    |t_integer      |'0'    |NOT NULL       |0
FIELD           |listen_dns     |t_varchar(255) |''     |NOT NULL       |0
FIELD           |host_metadata  |t_varchar(255) |''     |NOT NULL       |0
FIELD           |flags          |t_integer      |'0'    |NOT NULL       |0
FIELD           |tls_accepted   |t_integer      |'1'    |NOT NULL       |0
INDEX           |1              |clock

TABLE|dhosts|dhostid|0
FIELD           |dhostid        |t_id           |       |NOT NULL       |0
FIELD           |druleid        |t_id           |       |NOT NULL       |0                      |1|drules
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |lastup         |t_integer      |'0'    |NOT NULL       |0
FIELD           |lastdown       |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |druleid

TABLE|dservices|dserviceid|0
FIELD           |dserviceid     |t_id           |       |NOT NULL       |0
FIELD           |dhostid        |t_id           |       |NOT NULL       |0                      |1|dhosts
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
FIELD           |port           |t_integer      |'0'    |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |lastup         |t_integer      |'0'    |NOT NULL       |0
FIELD           |lastdown       |t_integer      |'0'    |NOT NULL       |0
FIELD           |dcheckid       |t_id           |       |NOT NULL       |0                      |2|dchecks
FIELD           |ip             |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |dns            |t_varchar(255) |''     |NOT NULL       |0
UNIQUE          |1              |dcheckid,ip,port
INDEX           |2              |dhostid

-- Other tables

TABLE|escalations|escalationid|0
FIELD           |escalationid   |t_id           |       |NOT NULL       |0
FIELD           |actionid       |t_id           |       |NOT NULL       |0                      |-|actions
FIELD           |triggerid      |t_id           |       |NULL           |0                      |-|triggers
FIELD           |eventid        |t_id           |       |NULL           |0                      |-|events
FIELD           |r_eventid      |t_id           |       |NULL           |0                      |-|events       |eventid
FIELD           |nextcheck      |t_time         |'0'    |NOT NULL       |0
FIELD           |esc_step       |t_integer      |'0'    |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |itemid         |t_id           |       |NULL           |0                      |-|items
FIELD           |acknowledgeid  |t_id           |       |NULL           |0                      |-|acknowledges
UNIQUE          |1              |triggerid,itemid,escalationid
INDEX           |2              |eventid
INDEX           |3              |nextcheck

TABLE|globalvars|globalvarid|0
FIELD           |globalvarid    |t_id           |       |NOT NULL       |0
FIELD           |snmp_lastsize  |t_bigint       |'0'    |NOT NULL       |0

TABLE|graph_discovery|graphid|0
FIELD           |graphid        |t_id           |       |NOT NULL       |0                      |1|graphs
FIELD           |parent_graphid |t_id           |       |NOT NULL       |0                      |2|graphs       |graphid                                               |RESTRICT
FIELD           |lastcheck      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ts_delete      |t_time         |'0'    |NOT NULL       |ZBX_NODATA
INDEX           |1              |parent_graphid

TABLE|host_inventory|hostid|0
FIELD           |hostid         |t_id           |       |NOT NULL       |0                      |1|hosts
FIELD           |inventory_mode |t_integer      |'0'    |NOT NULL       |0
FIELD           |type           |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |type_full      |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |name           |t_varchar(128) |''     |NOT NULL       |0
FIELD           |alias          |t_varchar(128) |''     |NOT NULL       |0
FIELD           |os             |t_varchar(128) |''     |NOT NULL       |0
FIELD           |os_full        |t_varchar(255) |''     |NOT NULL       |0
FIELD           |os_short       |t_varchar(128) |''     |NOT NULL       |0
FIELD           |serialno_a     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |serialno_b     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |tag            |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |asset_tag      |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |macaddress_a   |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |macaddress_b   |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |hardware       |t_varchar(255) |''     |NOT NULL       |0
FIELD           |hardware_full  |t_shorttext    |''     |NOT NULL       |0
FIELD           |software       |t_varchar(255) |''     |NOT NULL       |0
FIELD           |software_full  |t_shorttext    |''     |NOT NULL       |0
FIELD           |software_app_a |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |software_app_b |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |software_app_c |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |software_app_d |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |software_app_e |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |contact        |t_shorttext    |''     |NOT NULL       |0
FIELD           |location       |t_shorttext    |''     |NOT NULL       |0
FIELD           |location_lat   |t_varchar(16)  |''     |NOT NULL       |0
FIELD           |location_lon   |t_varchar(16)  |''     |NOT NULL       |0
FIELD           |notes          |t_shorttext    |''     |NOT NULL       |0
FIELD           |chassis        |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |model          |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |hw_arch        |t_varchar(32)  |''     |NOT NULL       |0
FIELD           |vendor         |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |contract_number|t_varchar(64)  |''     |NOT NULL       |0
FIELD           |installer_name |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |deployment_status|t_varchar(64)|''     |NOT NULL       |0
FIELD           |url_a          |t_varchar(255) |''     |NOT NULL       |0
FIELD           |url_b          |t_varchar(255) |''     |NOT NULL       |0
FIELD           |url_c          |t_varchar(255) |''     |NOT NULL       |0
FIELD           |host_networks  |t_shorttext    |''     |NOT NULL       |0
FIELD           |host_netmask   |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |host_router    |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |oob_ip         |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |oob_netmask    |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |oob_router     |t_varchar(39)  |''     |NOT NULL       |0
FIELD           |date_hw_purchase|t_varchar(64) |''     |NOT NULL       |0
FIELD           |date_hw_install|t_varchar(64)  |''     |NOT NULL       |0
FIELD           |date_hw_expiry |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |date_hw_decomm |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |site_address_a |t_varchar(128) |''     |NOT NULL       |0
FIELD           |site_address_b |t_varchar(128) |''     |NOT NULL       |0
FIELD           |site_address_c |t_varchar(128) |''     |NOT NULL       |0
FIELD           |site_city      |t_varchar(128) |''     |NOT NULL       |0
FIELD           |site_state     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |site_country   |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |site_zip       |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |site_rack      |t_varchar(128) |''     |NOT NULL       |0
FIELD           |site_notes     |t_shorttext    |''     |NOT NULL       |0
FIELD           |poc_1_name     |t_varchar(128) |''     |NOT NULL       |0
FIELD           |poc_1_email    |t_varchar(128) |''     |NOT NULL       |0
FIELD           |poc_1_phone_a  |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |poc_1_phone_b  |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |poc_1_cell     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |poc_1_screen   |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |poc_1_notes    |t_shorttext    |''     |NOT NULL       |0
FIELD           |poc_2_name     |t_varchar(128) |''     |NOT NULL       |0
FIELD           |poc_2_email    |t_varchar(128) |''     |NOT NULL       |0
FIELD           |poc_2_phone_a  |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |poc_2_phone_b  |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |poc_2_cell     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |poc_2_screen   |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |poc_2_notes    |t_shorttext    |''     |NOT NULL       |0

TABLE|housekeeper|housekeeperid|0
FIELD           |housekeeperid  |t_id           |       |NOT NULL       |0
FIELD           |tablename      |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |field          |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |value          |t_id           |       |NOT NULL       |0                      |-|items

TABLE|images|imageid|0
FIELD           |imageid        |t_id           |       |NOT NULL       |0
FIELD           |imagetype      |t_integer      |'0'    |NOT NULL       |0
FIELD           |name           |t_varchar(64)  |'0'    |NOT NULL       |0
FIELD           |image          |t_image        |''     |NOT NULL       |0
UNIQUE          |1              |name

TABLE|item_discovery|itemdiscoveryid|ZBX_TEMPLATE
FIELD           |itemdiscoveryid|t_id           |       |NOT NULL       |0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |1|items
FIELD           |parent_itemid  |t_id           |       |NOT NULL       |0                      |2|items        |itemid
FIELD           |key_           |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA
FIELD           |lastcheck      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ts_delete      |t_time         |'0'    |NOT NULL       |ZBX_NODATA
UNIQUE          |1              |itemid,parent_itemid
INDEX           |2              |parent_itemid

TABLE|host_discovery|hostid|ZBX_TEMPLATE
FIELD           |hostid         |t_id           |       |NOT NULL       |0                      |1|hosts
FIELD           |parent_hostid  |t_id           |       |NULL           |0                      |2|hosts        |hostid
|RESTRICT
FIELD           |parent_itemid  |t_id           |       |NULL           |0                      |3|items        |itemid
|RESTRICT
FIELD           |host           |t_varchar(128) |''     |NOT NULL       |ZBX_NODATA
FIELD           |lastcheck      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ts_delete      |t_time         |'0'    |NOT NULL       |ZBX_NODATA

TABLE|interface_discovery|interfaceid|0
FIELD           |interfaceid    |t_id           |       |NOT NULL       |0                      |1|interface
FIELD           |parent_interfaceid|t_id        |       |NOT NULL       |0                      |2|interface    |interfaceid

TABLE|profiles|profileid|0
FIELD           |profileid      |t_id           |       |NOT NULL       |0
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |1|users
FIELD           |idx            |t_varchar(96)  |''     |NOT NULL       |0
FIELD           |idx2           |t_id           |'0'    |NOT NULL       |0
FIELD           |value_id       |t_id           |'0'    |NOT NULL       |0
FIELD           |value_int      |t_integer      |'0'    |NOT NULL       |0
FIELD           |value_str      |t_varchar(255) |''     |NOT NULL       |0
FIELD           |source         |t_varchar(96)  |''     |NOT NULL       |0
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |userid,idx,idx2
INDEX           |2              |userid,profileid

TABLE|sessions|sessionid|0
FIELD           |sessionid      |t_varchar(32)  |''     |NOT NULL       |0
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |1|users
FIELD           |lastaccess     |t_integer      |'0'    |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |userid,status,lastaccess

TABLE|trigger_discovery|triggerid|0
FIELD           |triggerid      |t_id           |       |NOT NULL       |0                      |1|triggers
FIELD           |parent_triggerid|t_id          |       |NOT NULL       |0                      |2|triggers     |triggerid                                             |RESTRICT
FIELD           |lastcheck      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ts_delete      |t_time         |'0'    |NOT NULL       |ZBX_NODATA
INDEX           |1              |parent_triggerid

TABLE|application_template|application_templateid|ZBX_TEMPLATE
FIELD           |application_templateid|t_id    |       |NOT NULL       |0
FIELD           |applicationid  |t_id           |       |NOT NULL       |0                      |1|applications
FIELD           |templateid     |t_id           |       |NOT NULL       |0                      |2|applications |applicationid
UNIQUE          |1              |applicationid,templateid
INDEX           |2              |templateid

TABLE|item_condition|item_conditionid|ZBX_TEMPLATE
FIELD           |item_conditionid|t_id          |       |NOT NULL       |0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |1|items
FIELD           |operator       |t_integer      |'8'    |NOT NULL       |0
FIELD           |macro          |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |itemid

TABLE|item_rtdata|itemid|ZBX_TEMPLATE
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |1|items
FIELD           |lastlogsize    |t_bigint       |'0'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |state          |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |mtime          |t_integer      |'0'    |NOT NULL       |ZBX_PROXY,ZBX_NODATA
FIELD           |error          |t_varchar(2048)|''     |NOT NULL       |ZBX_NODATA

TABLE|application_prototype|application_prototypeid|ZBX_TEMPLATE
FIELD           |application_prototypeid|t_id   |       |NOT NULL       |0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |1|items
FIELD           |templateid     |t_id           |       |NULL           |0                      |2|application_prototype|application_prototypeid
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |itemid
INDEX           |2              |templateid

TABLE|item_application_prototype|item_application_prototypeid|ZBX_TEMPLATE
FIELD           |item_application_prototypeid|t_id|     |NOT NULL       |0
FIELD           |application_prototypeid|t_id   |       |NOT NULL       |0                      |1|application_prototype
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |2|items
UNIQUE          |1              |application_prototypeid,itemid
INDEX           |2              |itemid

TABLE|application_discovery|application_discoveryid|ZBX_TEMPLATE
FIELD           |application_discoveryid|t_id   |       |NOT NULL       |0
FIELD           |applicationid  |t_id           |       |NOT NULL       |0                      |1|applications
FIELD           |application_prototypeid|t_id   |       |NOT NULL       |0                      |2|application_prototype
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |ZBX_NODATA
FIELD           |lastcheck      |t_integer      |'0'    |NOT NULL       |ZBX_NODATA
FIELD           |ts_delete      |t_time         |'0'    |NOT NULL       |ZBX_NODATA
INDEX           |1              |applicationid
INDEX           |2              |application_prototypeid

TABLE|opinventory|operationid|ZBX_DATA
FIELD           |operationid    |t_id           |       |NOT NULL       |0                      |1|operations
FIELD           |inventory_mode |t_integer      |'0'    |NOT NULL       |0

TABLE|trigger_tag|triggertagid|ZBX_TEMPLATE
FIELD           |triggertagid   |t_id           |       |NOT NULL       |0
FIELD           |triggerid      |t_id           |       |NOT NULL       |0                      |1|triggers
FIELD           |tag            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |triggerid

TABLE|event_tag|eventtagid|0
FIELD           |eventtagid     |t_id           |       |NOT NULL       |0
FIELD           |eventid        |t_id           |       |NOT NULL       |0                      |1|events
FIELD           |tag            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |eventid

TABLE|problem|eventid|0
FIELD           |eventid        |t_id           |       |NOT NULL       |0                      |1|events
FIELD           |source         |t_integer      |'0'    |NOT NULL       |0
FIELD           |object         |t_integer      |'0'    |NOT NULL       |0
FIELD           |objectid       |t_id           |'0'    |NOT NULL       |0
FIELD           |clock          |t_time         |'0'    |NOT NULL       |0
FIELD           |ns             |t_nanosec      |'0'    |NOT NULL       |0
FIELD           |r_eventid      |t_id           |       |NULL           |0                      |2|events       |eventid
FIELD           |r_clock        |t_time         |'0'    |NOT NULL       |0
FIELD           |r_ns           |t_nanosec      |'0'    |NOT NULL       |0
FIELD           |correlationid  |t_id           |       |NULL           |0                      |-|correlation
FIELD           |userid         |t_id           |       |NULL           |0                      |-|users
FIELD           |name           |t_varchar(2048)|''     |NOT NULL       |0
FIELD           |acknowledged   |t_integer      |'0'    |NOT NULL       |0
FIELD           |severity       |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |source,object,objectid
INDEX           |2              |r_clock
INDEX           |3              |r_eventid

TABLE|problem_tag|problemtagid|0
FIELD           |problemtagid   |t_id           |       |NOT NULL       |0
FIELD           |eventid        |t_id           |       |NOT NULL       |0                      |1|problem
FIELD           |tag            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |eventid,tag,value

TABLE|tag_filter|tag_filterid|0
FIELD           |tag_filterid   |t_id           |       |NOT NULL       |0
FIELD           |usrgrpid       |t_id           |       |NOT NULL       |0                      |1|usrgrp       |usrgrpid
FIELD           |groupid        |t_id           |       |NOT NULL       |0                      |2|hstgrp       |groupid
FIELD           |tag    |t_varchar(255) |'' |NOT NULL   |0
FIELD           |value  |t_varchar(255) |'' |NOT NULL   |0

TABLE|event_recovery|eventid|0
FIELD           |eventid        |t_id           |       |NOT NULL       |0                      |1|events
FIELD           |r_eventid      |t_id           |       |NOT NULL       |0                      |2|events       |eventid
FIELD           |c_eventid      |t_id           |       |NULL           |0                      |3|events       |eventid
FIELD           |correlationid  |t_id           |       |NULL           |0                      |-|correlation
FIELD           |userid         |t_id           |       |NULL           |0                      |-|users
INDEX           |1              |r_eventid
INDEX           |2              |c_eventid

TABLE|correlation|correlationid|ZBX_DATA
FIELD           |correlationid  |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |description    |t_shorttext    |''     |NOT NULL       |0
FIELD           |evaltype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |formula        |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |status
UNIQUE          |2              |name

TABLE|corr_condition|corr_conditionid|ZBX_DATA
FIELD           |corr_conditionid|t_id          |       |NOT NULL       |0
FIELD           |correlationid  |t_id           |       |NOT NULL       |0                      |1|correlation
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |correlationid

TABLE|corr_condition_tag|corr_conditionid|ZBX_DATA
FIELD           |corr_conditionid|t_id          |       |NOT NULL       |0                      |1|corr_condition
FIELD           |tag            |t_varchar(255) |''     |NOT NULL       |0

TABLE|corr_condition_group|corr_conditionid|ZBX_DATA
FIELD           |corr_conditionid|t_id          |       |NOT NULL       |0                      |1|corr_condition
FIELD           |operator       |t_integer      |'0'    |NOT NULL       |0
FIELD           |groupid        |t_id           |       |NOT NULL       |0                      |2|hstgrp       |      |RESTRICT
INDEX           |1              |groupid

TABLE|corr_condition_tagpair|corr_conditionid|ZBX_DATA
FIELD           |corr_conditionid|t_id          |       |NOT NULL       |0                      |1|corr_condition
FIELD           |oldtag         |t_varchar(255) |''     |NOT NULL       |0
FIELD           |newtag         |t_varchar(255) |''     |NOT NULL       |0

TABLE|corr_condition_tagvalue|corr_conditionid|ZBX_DATA
FIELD           |corr_conditionid|t_id          |       |NOT NULL       |0                      |1|corr_condition
FIELD           |tag            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |operator       |t_integer      |'0'    |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0

TABLE|corr_operation|corr_operationid|ZBX_DATA
FIELD           |corr_operationid|t_id          |       |NOT NULL       |0
FIELD           |correlationid  |t_id           |       |NOT NULL       |0                      |1|correlation
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |correlationid

TABLE|task|taskid|0
FIELD           |taskid         |t_id           |       |NOT NULL       |0
FIELD           |type           |t_integer      |       |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |clock          |t_integer      |'0'    |NOT NULL       |0
FIELD           |ttl            |t_integer      |'0'    |NOT NULL       |0
FIELD           |proxy_hostid   |t_id           |       |NULL           |0                      |1|hosts        |hostid
INDEX           |1              |status,proxy_hostid

TABLE|task_close_problem|taskid|0
FIELD           |taskid         |t_id           |       |NOT NULL       |0                      |1|task
FIELD           |acknowledgeid  |t_id           |       |NOT NULL       |0                      |-|acknowledges

TABLE|item_preproc|item_preprocid|ZBX_TEMPLATE
FIELD           |item_preprocid |t_id           |       |NOT NULL       |0
FIELD           |itemid         |t_id           |       |NOT NULL       |ZBX_PROXY                      |1|items
FIELD           |step           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |type           |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |params         |t_shorttext    |''     |NOT NULL       |ZBX_PROXY
FIELD           |error_handler  |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |error_handler_params|t_varchar(255)|'' |NOT NULL       |ZBX_PROXY
INDEX           |1              |itemid,step

TABLE|task_remote_command|taskid|0
FIELD           |taskid         |t_id           |       |NOT NULL       |0                      |1|task
FIELD           |command_type   |t_integer      |'0'    |NOT NULL       |0
FIELD           |execute_on     |t_integer      |'0'    |NOT NULL       |0
FIELD           |port           |t_integer      |'0'    |NOT NULL       |0
FIELD           |authtype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |username       |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |password       |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |publickey      |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |privatekey     |t_varchar(64)  |''     |NOT NULL       |0
FIELD           |command        |t_shorttext    |''     |NOT NULL       |0
FIELD           |alertid        |t_id           |       |NULL           |0                      |-|alerts
FIELD           |parent_taskid  |t_id           |       |NOT NULL       |0                      |-|task         |taskid
FIELD           |hostid         |t_id           |       |NOT NULL       |0                      |-|hosts

TABLE|task_remote_command_result|taskid|0
FIELD           |taskid         |t_id           |       |NOT NULL       |0                      |1|task
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |parent_taskid  |t_id           |       |NOT NULL       |0                      |-|task         |taskid
FIELD           |info           |t_shorttext    |''     |NOT NULL       |0

TABLE|task_data|taskid|0
FIELD           |taskid         |t_id           |       |NOT NULL       |0                      |1|task
FIELD           |type   |t_integer      |'0'    |NOT NULL       |0
FIELD           |data   |t_text |''     |NOT NULL       |0
FIELD           |parent_taskid  |t_id           |       |NOT NULL       |0                      |-|task         |taskid

TABLE|task_result|taskid|0
FIELD           |taskid         |t_id           |       |NOT NULL       |0                      |1|task
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |parent_taskid  |t_id           |       |NOT NULL       |0                      |-|task         |taskid
FIELD           |info           |t_text         |''     |NOT NULL       |0
INDEX           |1              |parent_taskid

TABLE|task_acknowledge|taskid|0
FIELD           |taskid         |t_id           |       |NOT NULL       |0                      |1|task
FIELD           |acknowledgeid  |t_id           |       |NOT NULL       |0                      |-|acknowledges

TABLE|sysmap_shape|sysmap_shapeid|ZBX_TEMPLATE
FIELD           |sysmap_shapeid |t_id           |       |NOT NULL       |0
FIELD           |sysmapid       |t_id           |       |NOT NULL       |0                      |1|sysmaps
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
FIELD           |x              |t_integer      |'0'    |NOT NULL       |0
FIELD           |y              |t_integer      |'0'    |NOT NULL       |0
FIELD           |width          |t_integer      |'200'  |NOT NULL       |0
FIELD           |height         |t_integer      |'200'  |NOT NULL       |0
FIELD           |text           |t_shorttext    |''     |NOT NULL       |0
FIELD           |font           |t_integer      |'9'    |NOT NULL       |0
FIELD           |font_size      |t_integer      |'11'   |NOT NULL       |0
FIELD           |font_color     |t_varchar(6)   |'000000'|NOT NULL      |0
FIELD           |text_halign    |t_integer      |'0'    |NOT NULL       |0
FIELD           |text_valign    |t_integer      |'0'    |NOT NULL       |0
FIELD           |border_type    |t_integer      |'0'    |NOT NULL       |0
FIELD           |border_width   |t_integer      |'1'    |NOT NULL       |0
FIELD           |border_color   |t_varchar(6)   |'000000'|NOT NULL      |0
FIELD           |background_color|t_varchar(6)  |''     |NOT NULL       |0
FIELD           |zindex         |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |sysmapid

TABLE|sysmap_element_trigger|selement_triggerid|ZBX_TEMPLATE
FIELD           |selement_triggerid     |t_id   |       |NOT NULL       |0
FIELD           |selementid             |t_id   |       |NOT NULL       |0                      |1|sysmaps_elements
FIELD           |triggerid              |t_id   |       |NOT NULL       |0                      |2|triggers
UNIQUE          |1                      |selementid,triggerid

TABLE|httptest_field|httptest_fieldid|ZBX_TEMPLATE
FIELD           |httptest_fieldid       |t_id           |       |NOT NULL       |0
FIELD           |httptestid             |t_id           |       |NOT NULL       |ZBX_PROXY      |1|httptest
FIELD           |type                   |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |name                   |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |value                  |t_shorttext    |''     |NOT NULL       |ZBX_PROXY
INDEX           |1                      |httptestid

TABLE|httpstep_field|httpstep_fieldid|ZBX_TEMPLATE
FIELD           |httpstep_fieldid       |t_id           |       |NOT NULL       |0
FIELD           |httpstepid             |t_id           |       |NOT NULL       |ZBX_PROXY      |1|httpstep
FIELD           |type                   |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |name                   |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY
FIELD           |value                  |t_shorttext    |''     |NOT NULL       |ZBX_PROXY
INDEX           |1                      |httpstepid

TABLE|dashboard|dashboardid|ZBX_DASHBOARD
FIELD           |dashboardid    |t_id           |       |NOT NULL       |0
FIELD           |name           |t_varchar(255) |       |NOT NULL       |0
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |1|users        |                                                      |RESTRICT
FIELD           |private        |t_integer      |'1'    |NOT NULL       |0

TABLE|dashboard_user|dashboard_userid|ZBX_DASHBOARD
FIELD           |dashboard_userid|t_id          |       |NOT NULL       |0
FIELD           |dashboardid    |t_id           |       |NOT NULL       |0                      |1|dashboard
FIELD           |userid         |t_id           |       |NOT NULL       |0                      |2|users
FIELD           |permission     |t_integer      |'2'    |NOT NULL       |0
UNIQUE          |1              |dashboardid,userid

TABLE|dashboard_usrgrp|dashboard_usrgrpid|ZBX_DASHBOARD
FIELD           |dashboard_usrgrpid|t_id        |       |NOT NULL       |0
FIELD           |dashboardid    |t_id           |       |NOT NULL       |0                      |1|dashboard
FIELD           |usrgrpid       |t_id           |       |NOT NULL       |0                      |2|usrgrp
FIELD           |permission     |t_integer      |'2'    |NOT NULL       |0
UNIQUE          |1              |dashboardid,usrgrpid

TABLE|widget|widgetid|ZBX_DASHBOARD
FIELD           |widgetid       |t_id           |       |NOT NULL       |0
FIELD           |dashboardid    |t_id           |       |NOT NULL       |0                      |1|dashboard
FIELD           |type           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |x              |t_integer      |'0'    |NOT NULL       |0
FIELD           |y              |t_integer      |'0'    |NOT NULL       |0
FIELD           |width          |t_integer      |'1'    |NOT NULL       |0
FIELD           |height         |t_integer      |'2'    |NOT NULL       |0
FIELD           |view_mode      |t_integer      |'0'    |NOT NULL       |0
INDEX           |1              |dashboardid

TABLE|widget_field|widget_fieldid|ZBX_DASHBOARD
FIELD           |widget_fieldid |t_id           |       |NOT NULL       |0
FIELD           |widgetid       |t_id           |       |NOT NULL       |0                      |1|widget
FIELD           |type           |t_integer      |'0'    |NOT NULL       |0
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |value_int      |t_integer      |'0'    |NOT NULL       |0
FIELD           |value_str      |t_varchar(255) |''     |NOT NULL       |0
FIELD           |value_groupid  |t_id           |       |NULL           |0                      |2|hstgrp       |groupid
FIELD           |value_hostid   |t_id           |       |NULL           |0                      |3|hosts        |hostid
FIELD           |value_itemid   |t_id           |       |NULL           |0                      |4|items        |itemid
FIELD           |value_graphid  |t_id           |       |NULL           |0                      |5|graphs       |graphid
FIELD           |value_sysmapid |t_id           |       |NULL           |0                      |6|sysmaps      |sysmapid
INDEX           |1              |widgetid
INDEX           |2              |value_groupid
INDEX           |3              |value_hostid
INDEX           |4              |value_itemid
INDEX           |5              |value_graphid
INDEX           |6              |value_sysmapid

TABLE|task_check_now|taskid|0
FIELD           |taskid         |t_id           |       |NOT NULL       |0                      |1|task
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |-|items

TABLE|event_suppress|event_suppressid|0
FIELD           |event_suppressid|t_id          |       |NOT NULL       |0
FIELD           |eventid        |t_id           |       |NOT NULL       |0                      |1|events
FIELD           |maintenanceid  |t_id           |       |NULL           |0                      |2|maintenances
FIELD           |suppress_until |t_time         |'0'    |NOT NULL       |0
UNIQUE          |1              |eventid,maintenanceid
INDEX           |2              |suppress_until
INDEX           |3              |maintenanceid

TABLE|maintenance_tag|maintenancetagid|ZBX_DATA
FIELD           |maintenancetagid|t_id          |       |NOT NULL       |0
FIELD           |maintenanceid  |t_id           |       |NOT NULL       |0                      |1|maintenances
FIELD           |tag            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |operator       |t_integer      |'2'    |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |maintenanceid

TABLE|lld_macro_path|lld_macro_pathid|ZBX_TEMPLATE
FIELD           |lld_macro_pathid|t_id          |       |NOT NULL       |0
FIELD           |itemid         |t_id           |       |NOT NULL       |0                      |1|items
FIELD           |lld_macro      |t_varchar(255) |''     |NOT NULL       |0
FIELD           |path           |t_varchar(255) |''     |NOT NULL       |0
UNIQUE          |1              |itemid,lld_macro

TABLE|host_tag|hosttagid|ZBX_TEMPLATE
FIELD           |hosttagid      |t_id           |       |NOT NULL       |0
FIELD           |hostid         |t_id           |       |NOT NULL       |0                      |1|hosts
FIELD           |tag            |t_varchar(255) |''     |NOT NULL       |0
FIELD           |value          |t_varchar(255) |''     |NOT NULL       |0
INDEX           |1              |hostid

TABLE|config_autoreg_tls|autoreg_tlsid|ZBX_DATA
FIELD           |autoreg_tlsid  |t_id           |       |NOT NULL       |0
FIELD           |tls_psk_identity|t_varchar(128)|''     |NOT NULL       |ZBX_PROXY
FIELD           |tls_psk        |t_varchar(512) |''     |NOT NULL       |ZBX_PROXY
UNIQUE          |1              |tls_psk_identity

TABLE|module|moduleid|
FIELD           |moduleid       |t_id           |       |NOT NULL       |0
FIELD           |id             |t_varchar(255) |''     |NOT NULL       |0
FIELD           |relative_path  |t_varchar(255) |''     |NOT NULL       |0
FIELD           |status         |t_integer      |'0'    |NOT NULL       |0
FIELD           |config         |t_shorttext    |''     |NOT NULL       |0

TABLE|interface_snmp|interfaceid|ZBX_TEMPLATE
FIELD           |interfaceid    |t_id           |       |NOT NULL       |0                      |1|interface
FIELD           |version        |t_integer      |'2'    |NOT NULL       |ZBX_PROXY
FIELD           |bulk           |t_integer      |'1'    |NOT NULL       |ZBX_PROXY
FIELD           |community      |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |securityname   |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |securitylevel  |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |authpassphrase |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |privpassphrase |t_varchar(64)  |''     |NOT NULL       |ZBX_PROXY
FIELD           |authprotocol   |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |privprotocol   |t_integer      |'0'    |NOT NULL       |ZBX_PROXY
FIELD           |contextname    |t_varchar(255) |''     |NOT NULL       |ZBX_PROXY

TABLE|lld_override|lld_overrideid|ZBX_TEMPLATE
FIELD           |lld_overrideid |t_id           |       |NOT NULL       |0
FIELD           |itemid         |t_id           |       |NOT NULL       |0      |1|items
FIELD           |name           |t_varchar(255) |''     |NOT NULL       |0
FIELD           |step           |t_integer      |'0'    |NOT NULL       |0
FIELD           |evaltype       |t_integer      |'0'    |NOT NULL       |0
FIELD           |formula        |t_varchar(255) |''     |NOT NULL       |0
FIELD           |stop           |t_integer      |'0'    |NOT NULL       |0
UNIQUE          |1              |itemid,name

TABLE|lld_override_condition|lld_override_conditionid|ZBX_TEMPLATE
FIELD   |lld_override_conditionid       |t_id           |       |NOT NULL       |0
FIELD   |lld_overrideid                 |t_id           |       |NOT NULL       |0      |1|lld_override
FIELD   |operator                       |t_integer      |'8'    |NOT NULL       |0
FIELD   |macro                          |t_varchar(64)  |''     |NOT NULL       |0
FIELD   |value                          |t_varchar(255) |''     |NOT NULL       |0
INDEX   |1                              |lld_overrideid

TABLE|lld_override_operation|lld_override_operationid|ZBX_TEMPLATE
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0
FIELD   |lld_overrideid                 |t_id           |       |NOT NULL       |0      |1|lld_override
FIELD   |operationobject                |t_integer      |'0'    |NOT NULL       |0
FIELD   |operator                       |t_integer      |'0'    |NOT NULL       |0
FIELD   |value                          |t_varchar(255) |''     |NOT NULL       |0
INDEX   |1                              |lld_overrideid

TABLE|lld_override_opstatus|lld_override_operationid|ZBX_TEMPLATE
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0      |1|lld_override_operation
FIELD   |status                         |t_integer      |'0'    |NOT NULL       |0

TABLE|lld_override_opdiscover|lld_override_operationid|ZBX_TEMPLATE
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0      |1|lld_override_operation
FIELD   |discover                       |t_integer      |'0'    |NOT NULL       |0

TABLE|lld_override_opperiod|lld_override_operationid|ZBX_TEMPLATE
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0      |1|lld_override_operation
FIELD   |delay                          |t_varchar(1024)|'0'    |NOT NULL       |0

TABLE|lld_override_ophistory|lld_override_operationid|ZBX_TEMPLATE
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0      |1|lld_override_operation
FIELD   |history                        |t_varchar(255) |'90d'  |NOT NULL       |0

TABLE|lld_override_optrends|lld_override_operationid|ZBX_TEMPLATE
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0      |1|lld_override_operation
FIELD   |trends                         |t_varchar(255) |'365d' |NOT NULL       |0

TABLE|lld_override_opseverity|lld_override_operationid|ZBX_TEMPLATE
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0      |1|lld_override_operation
FIELD   |severity                       |t_integer      |'0'    |NOT NULL       |0

TABLE|lld_override_optag|lld_override_optagid|ZBX_TEMPLATE
FIELD   |lld_override_optagid           |t_id           |       |NOT NULL       |0
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0      |1|lld_override_operation
FIELD   |tag                            |t_varchar(255) |''     |NOT NULL       |0
FIELD   |value                          |t_varchar(255) |''     |NOT NULL       |0
INDEX   |1                              |lld_override_operationid

TABLE|lld_override_optemplate|lld_override_optemplateid|ZBX_TEMPLATE
FIELD   |lld_override_optemplateid      |t_id           |       |NOT NULL       |0
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0      |1|lld_override_operation
FIELD   |templateid                     |t_id           |       |NOT NULL       |0      |2|hosts        |hostid |RESTRICT
UNIQUE  |1                              |lld_override_operationid,templateid
INDEX   |2                              |templateid

TABLE|lld_override_opinventory|lld_override_operationid|ZBX_TEMPLATE
FIELD   |lld_override_operationid       |t_id           |       |NOT NULL       |0      |1|lld_override_operation
FIELD   |inventory_mode                 |t_integer      |'0'    |NOT NULL       |0

TABLE|dbversion||
FIELD           |mandatory      |t_integer      |'0'    |NOT NULL       |
FIELD           |optional       |t_integer      |'0'    |NOT NULL       |
ROW             |5010028        |5010028