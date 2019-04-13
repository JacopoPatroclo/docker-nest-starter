### Nestjs Docker starter
This is a dockerized Nestjs starter with MariaDB and Typeorm with automatic, production safe, migrations.

## How
Copy the `.env.example` in a `.env` file and change it in order to reflect `.ormconfig.json` or the other way around.

This project use a docker-compose strategy in order to have a set of composable docker-composes files. The base file is the one in the root and the other are in `./docker-composes`. In order to run the choose configuration you need to merge the files with `-f` or you can use the helpers scripts in `./scripts/dev`.

Just run `./scripts/dev/start` to run the project in development mode or run `./scripts/dev/test` to run the tests. If you want to add other flags you can do for example `./scripts/dev/start --build`. Keep in mind that the command hide in `./scripts/dev/` script is a `docker-compose up`.

## In Production?
In teory the orchestrator that is going to run your images shoud already have all the enviroments variable and the networking and orchestration configurations (ex. see [Kubernetes pods declaration](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)). But if you want to use docker-compose in production you only need two thigs:
  1. Add all the env variable in the host machine o through a .env file in the same directory of the docker-compose file.
  2. Run `docker-compose up`

NB: There shoudn't be any source code or use of the file system on the bear metal that is going to run the images.