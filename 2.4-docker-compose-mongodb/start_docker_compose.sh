# docker-compose up
docker-compose up --detach # roda em background
docker ps
docker exec -it irpronto-docker_app_1 /bin/sh ./pull.sh
docker-compose stop
docker-compose start
# docker logs irpronto-docker_app_1 -f --tail 100