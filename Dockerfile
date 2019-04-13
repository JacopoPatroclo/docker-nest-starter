FROM node:8.15.0-alpine

WORKDIR /usr/app/

COPY package*.json /usr/app/

RUN npm install

# COPY PROD RELATED STUFF
COPY ./src /usr/app/src
COPY ./test /usr/app/test
COPY tsconfig.json /usr/app/
COPY tslint.json /usr/app/
COPY tsconfig.build.json /usr/app/
COPY nest-cli.json /usr/app/
COPY ormconfig.json /usr/app/
COPY nodemon.json /usr/app/
COPY nodemon-debug.json /usr/app/

# ENTRYPOINT
COPY ./scripts/entrypoint.sh /usr/bin/entrypoint

RUN npm run prestart:prod

# EXPOSE DEBUG PORT
EXPOSE 8990-8991
EXPOSE 3000
ENTRYPOINT [ "entrypoint" ]
CMD [ "start" ]
