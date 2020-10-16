FROM nginx
RUN rm -f /etc/nginx/conf.d/*
ADD nginx.conf /etc/nginx/nginx.conf
CMD /usr/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf