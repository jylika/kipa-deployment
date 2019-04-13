# Kipa - Kisapalvelu - Deployment with Docker

Deploys master branch of https://github.com/partio-scout/kipa with Docker. 


Deployed container includes

- [Kipa](https://github.com/partio-scout/kipa)
- [uWSGI](https://uwsgi.readthedocs.io/en/latest/index.html)
- [NGINX](https://www.nginx.com/)
- [Supervisor](http://supervisord.org/)


## Prerequisites

- [Docker](https://docs.docker.com/install/)
- [Docker-Compose](https://docs.docker.com/compose/install/)


## Usage

### Start

__Basic__

    docker-compose up --detach

__Force build__

    docker-compose up --detach --force-recreate --build
    

### Monitor running container

__List running containers of the deployment__

    docker-compose ps

 

__Inspect logs__

    docker-compose logs --tail 100 --follow
   
   
   
### Stop

__Basic__

    docker-compose down


__Remove volumes__

    docker-compose down --volumes


__Clean build environment__

    docker-compose down --remove-orphans --rmi all
    

### Clean environment

__Clean docker environment completely (factory reset)__
    
    docker system prune --all
    
  
## Documentation
- [docker-compose up](https://docs.docker.com/compose/reference/up/)
- [docker-compose ps](https://docs.docker.com/compose/reference/ps/)
- [docker-compose logs](https://docs.docker.com/compose/reference/logs/)
- [docker-compose down](https://docs.docker.com/compose/reference/down/)
- [docker pruning](https://docs.docker.com/config/pruning/)
- [uWSGI - Deploying Django](https://uwsgi-docs.readthedocs.io/en/latest/WSGIquickstart.html#deploying-django)
- [Django - uWSGI, NGINX](https://uwsgi-docs.readthedocs.io/en/latest/tutorials/Django_and_nginx.html)


