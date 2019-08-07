# Seapay

[![pipeline status](https://gitlab.com/alexanderv21/seapay-microservice/badges/master/pipeline.svg)](https://gitlab.com/alexanderv21/seapay-microservice/commits/master)
[![coverage report](https://gitlab.com/alexanderv21/seapay-microservice/badges/master/coverage.svg)](https://gitlab.com/alexanderv21/seapay-microservice/commits/master)

## Description

Seapay is a fintech app consists of 4 different services:

- API gateway
  - API gateway service routes all requests to other services
- User account
  - User account service takes care of user management: user creation, get user data, etc
- Wallet
  - Wallet service handles all wallet functionalities: update balance, get balance, create wallet, etc
- Transaction
  - Transaction service manage all transaction data

The project itself has 4 modules:

- seapay-api
  - a module that abstracts interface for all services
- seapay-common
  - a module that groups all common functionalities used by all services
- seapay-domain
  - the bussiness logic for all services goes here
- seapay-monolith
  - an entry point of our monolithic app, including all handlers

## How to use

### Dependencies

[Docker](https://docs.docker.com/install/)

### How to build

```bash
# create db data folder (if not exist)
mkdir -p ./pgdata

# run db on detached docker container
docker-compose -f docker-compose-monolith-staging.yml up db -d

# tail log
## get container's name
docker ps
## tail container's log
docker logs -t -f [container_name]

# run build
docker-compose -f docker-compose-monolith-staging.yml run app make all

# to stop db container
docker-compose -f docker-compose-monolith-staging.yml down
```

### How to run

```bash
# to run monolith
docker-compose -f docker-compose-monolith-staging.yml up -d

# tail log
## get container's name
docker ps
## tail container's log
docker logs -t -f [container_name]

# to stop
docker-compose -f docker-compose-monolith-staging.yml down
```

```bash
# to run microservices
docker-compose -f docker-compose-microservices-staging.yml up -d

# tail log
## get container's name
docker ps
## tail container's log
docker logs -t -f [container_name]

# to stop
docker-compose -f docker-compose-microservices-staging.yml down -d
```

```bash
# to cleanup all containers
docker rm -f $(docker ps -aq)
```