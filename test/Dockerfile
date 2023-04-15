FROM nginx:alpine
RUN apk add nodejs npm apache2-utils

# install pouchdb-server
WORKDIR /usr/app
RUN npm init -f
RUN npm install pouchdb-fauxton
RUN npm install pouchdb-server
RUN cd node_modules/pouchdb-fauxton && npm link
RUN cd node_modules/pouchdb-server && npm link pouchdb-fauxton

# install nginx proxy for authentication
COPY nginx.conf /etc/nginx/conf.d/default.conf
ARG USERNAME
ARG PASSWORD
RUN htpasswd -b -c /etc/nginx/.htpasswd $USERNAME $PASSWORD

EXPOSE 8080
COPY bootstrap.sh .
ENTRYPOINT [ "sh", "bootstrap.sh" ]