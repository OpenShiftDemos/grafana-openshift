FROM centos:7
MAINTAINER Erik Jacobs <erikmjacobs@gmail.com>

USER root
EXPOSE 3000

ADD root /
RUN yum -y install https://grafanarel.s3.amazonaws.com/builds/grafana-3.1.0-1468321182.x86_64.rpm \
    && yum clean all
COPY run.sh /usr/share/grafana/
RUN /usr/bin/fix-permissions /usr/share/grafana \
    && /usr/bin/fix-permissions /etc/grafana \
    && /usr/bin/fix-permissions /var/lib/grafana \
    && /usr/bin/fix-permissions /var/log/grafana 

WORKDIR /usr/share/grafana
ENTRYPOINT ["./run.sh"]
