# Final stack

  - Nginx (SSL termination and service proxy)
  - Static website at `example.com`
  - Single Page App (Vue) at `app.example.com`
  - Restful API (nodejs) at `api.example.com`
  - MySQL database (mariadb)
  - Redis
  - Minio (aws s3 mocking for development)

# Scripts `.sh` (TBD)


## Useful commands

#### Compose for development
`docker-compose up -d`

#### Compose for production
`docker-compose -f docker-compose.yml -f docker-compose.production.yml up -d`

#### Open shell with api service as context
`docker-compose run --rm api sh`
`docker-compose exec [service] [command]`

#### Open shell with api service as context
`docker-compose exec -e PORT=3001 api adonis test`