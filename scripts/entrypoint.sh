#!/usr/bin/env sh

if [ "${NODE_ENV}" == "development" ]
then

    echo "development mode on"

    # Install here your global development package

    # INSTALL NEST CLI
    npm i -g @nestjs/cli

fi

npm run migration:run

npm "$@"
