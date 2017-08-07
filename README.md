# Simple PHP + Apache image with Redis as a session manager

This is a simple implementation of Redis as a PHP session manager behind the code.

This implementation was made to ease the migration process of a legacy PHP 5.6 application.

php:5.6-apache [Dockerfile](Dockerfile)

## How to use

- Deploy a Redis container  
```docker run --name redis -d redis```
- Pull the image  
```docker pull dawtaylor/php-redis-session```
- Run the container  
```docker run -d --name my-app -v . dawtaylor/php-redis-session```