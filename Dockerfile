FROM node:20.17.0-alpine

RUN    apk --no-cache --update add bash curl nginx nginx-mod-http-fancyindex tzdata \
    && wget -qO/tmp/source.tar.gz "https://oaklab.hu/crys/epg/-/archive/master/epg-master.tar.gz" \
    && mkdir -p /app/guides \
    && tar xzf /tmp/source.tar.gz -C /app --strip-components=1 \
    && rm -rf /tmp/source.tar.gz \
    && cd /app \
    && npm install

WORKDIR /app

COPY ./nginx.default.conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

EXPOSE 9980
