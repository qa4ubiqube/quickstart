FROM ubiqube/ubi-centos7:latest

RUN yum install -y redhat-lsb-core openssh-server sudo iptables-services net-snmp net-snmp-utils tcpdump rsyslog dmidecode && \
  yum clean all && \
  rm -rf /var/cache/yum

RUN passwd --stdin root <<< "ubiqube"
RUN useradd msa
RUN passwd --stdin msa <<< "ubiqube"
RUN echo 'msa  ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
#RUN echo ':msg, contains, "Time has been changed" ~ ' > /etc/rsyslog.d/time_msgs.conf
RUN echo '*.* @msa_front' > /etc/rsyslog.d/mini_lab.conf
COPY resources/* /
COPY snmpd.conf /etc/snmp/
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh
CMD [ "/docker-entrypoint.sh" ]