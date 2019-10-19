FROM rabbitmq:3.8.0-management-alpine

ADD init.sh /
ADD config_rabbit.sh /
ADD rabbit.definitions.json /
RUN chmod +x /init.sh /config_rabbit.sh
EXPOSE 5672 15671 15672

ENTRYPOINT ["/init.sh"]
