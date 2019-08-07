#!/bin/bash

# create migration conf
cat <<EOT >> ${PWD}/flyway.conf
flyway.url=$DB_URL
flyway.user=$DB_USERNAME
flyway.password=
EOT

# run migration
until PGPASSWORD=$DB_PASSWORD psql -h $DB_HOST -U $DB_USERNAME -c '\q'; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
>&2 echo "Postgres is up - executing command"

${PWD}/flyway/flyway -configFiles=${PWD}/flyway.conf migrate
