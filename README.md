# Simple PHP + Apache image with Redis as a session manager

This is a simple implementation of Redis as a PHP session manager behind the code.

As this is a simple implementation, it has been configured to connect to an unsecure Redis server. You can easily fix this by creating a Dockerfile and modifying the `session.save_path`.

```
FROM dawtaylor/php-redis-session

RUN sed -d 's/tcp:\/\/redis\/6379/YOUR_REDIS_CONNECTION_STRING/' /usr/local/etc/php/conf.d/docker-php-ext-redis.ini
```

This implementation was made to ease the migration process of a legacy PHP 5.6 application. Now it also has support for PHP 7.1.

php-redis-session:7.1-apache [Dockerfile](https://github.com/DawTaylor/php-redis-session/blob/master/php-7.1/Dockerfile)

php-redis-session:5.6-apache [Dockerfile](https://github.com/DawTaylor/php-redis-session/blob/master/php-5.6/Dockerfile)

## How to use

- Deploy a Redis container  
```docker run --name redis -d redis```
- Pull the image  
```docker pull dawtaylor/php-redis-session:php5.6-apache```
- Run the container  
```docker run -d --name my-app -v $(PWD).:/var/www/html dawtaylor/php-redis-session:5.6-apache```