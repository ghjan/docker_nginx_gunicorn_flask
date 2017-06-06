#!/bin/sh
makedir -p /var/log/gunicorn
cd /var/www/demo
# gunicorn --workers 3 --bind unix:myproject.sock --daemon -m 007 --user www-data --worker-class gevent wsgi:app
gunicorn -c /etc/gunicorn.conf  wsgi:app
nginx
tail -F /var/log/nginx/*
