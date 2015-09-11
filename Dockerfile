FROM ubuntu
RUN apt-get -y install nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY default /etc/nginx/sites-available/
COPY geoip /etc/nginx/geoip
COPY 404.html /usr/share/nginx/html/

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
