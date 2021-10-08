#!/bin/bash

# initialize sms configuration
# should be started before systemd in order to have template files resolved
/usr/bin/ssh-keygen -A
/sbin/sshd
/usr/sbin/snmpd
/usr/sbin/rsyslogd
# run systemd
exec /usr/sbin/init