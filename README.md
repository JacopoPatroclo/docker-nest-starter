### Nestjs Docker starter
This is a dockerized Nestjs starter with MariaDB and Typeorm with automatic and production safe migrations.

## How
Copy the `.env.example` in a `.env` file and change it to reflect `.ormconfig.json` or the other way around.

This project use a docker-compose strategy in order to have a set of composable docker-composes files. The base file is the one in the root while the others can be found in `./docker-composes`. To run the chosen configuration you need to merge the files with `-f` or you can use the helpers scripts in `./scripts/dev`.

Just launch `./scripts/dev/start` to run the project in development mode or use `./scripts/dev/test` to run the tests. If you want to add other flags, for example, you can type `./scripts/dev/start --build`. Keep in mind that the command hide in `./scripts/dev/` script is a `docker-compose up`.

## In Production?
In theory the orchestrator that is going to run your images should already have all the enviroment variables and the networking and orchestration configurations (eg. see [Kubernetes pods declaration](https://kubernetes.io/docs/tasks/inject-data-application/define-environment-variable-container/)). But if you want to use docker-compose in production you only need two thigs:
  1. Add all the env variables in the host machine o through a .env file in the same directory of the docker-compose file.
  2. Run `docker-compose up`

NB: There shoudn't be any source code or use of the file system on the bare metal that is going to run the images.
