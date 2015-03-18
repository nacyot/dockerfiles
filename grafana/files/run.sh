#!/bin/bash

/usr/sbin/httpd -d . -f /etc/httpd/conf/httpd.conf -e info -DFOREGROUND

