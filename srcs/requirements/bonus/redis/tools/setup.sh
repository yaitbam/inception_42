#!bin/sh

# Change some settings in conf file
sed -i "s|bind 127.0.0.1|#bind 127.0.0.1|g" /etc/redis.conf
sed -i "s|# maxmemory <bytes>|maxmemory 128mb|g" /etc/redis.conf
sed -i "s|maxmemory-policy noeviction|maxmemory-policy allkeys-lfu|g" /etc/redis.conf
sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis.conf

# Make the server run in the foreground
/usr/bin/redis-server /etc/redis.conf

#To monitor Redis, use the redis-cli command like so:
# redis-cli monitor : When you run this command, you will see the real-time output of Redis serving cached queries. 
# redis-cli keys '*' to see all the data
