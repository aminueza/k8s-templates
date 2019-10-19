#!/bin/bash

# This script needs to be executed just once
if [ -f /$0.completed ] ; then
  echo "$0 `date` /$0.completed found, skipping run"
  exit 0
fi

# Wait for RabbitMQ startup
for (( ; ; )) ; do
  sleep 5
  rabbitmqctl -q node_health_check > /dev/null 2>&1
  if [ $? -eq 0 ] ; then
    echo "$0 `date` rabbitmq is now running"
    break
  else
    echo "$0 `date` waiting for rabbitmq startup"
  fi
done

# Execute RabbitMQ config commands here
rabbitmqadmin -q import rabbit.definitions.json
echo "$0 `date` configurations imported"

# Create user
rabbitmqctl add_user amqp amqp123
rabbitmqctl set_user_tags amqp administrator
rabbitmqctl set_permissions -p / amqp ".*" ".*" ".*"
echo "$0 `date` user amqp created"

# Create mark so script is not ran again
touch /$0.completed
