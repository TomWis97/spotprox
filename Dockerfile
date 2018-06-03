FROM centos:7
RUN yum install httpd-tools squid -y && \
    yum clean all && \
    touch /etc/squid/passwords && \
    chown squid:root /etc/squid/passwords && \
    chown squid:root /var/run 
ENV SQUID_PASSWORD=UserPassword123
COPY config /etc/squid/
COPY start.sh /start.sh
EXPOSE 56565    
USER squid
CMD /start.sh
