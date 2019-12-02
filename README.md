# README

## Getting started

1. Build docker container:

        $ docker-compose build

2. Run migrations:

        $ docker-compose run web rails db:create db:setup

3. Start up the server:

        $ docker-compose up

## Usage examples

1. Fetch the list of the given Areas in `GeoJSON` fromat:

        $ curl -H "Accept: application/json" -H "Content-type: application/json" $(docker-machine ip):3000/areas

2. Create a Location:

        $ curl -H "Accept: application/json" -H "Content-type: application/json" -X POST -d ' {"name":"Salzburg"}' $(docker-machine ip):3000/locations

3. Fetch Location by ID:

        $ curl -H "Accept: application/json" -H "Content-type: application/json" $(docker-machine ip):3000/locations/1
