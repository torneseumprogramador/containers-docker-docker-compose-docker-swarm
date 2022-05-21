# para buildar imagem
```shell
docker-compose build
```

# para criar e levantar
```shell
docker-compose up
docker-compose up --detach # roda em background
```

# para levantar
```shell
docker-compose start
```

# para derrubar
```shell
docker-compose stop
```

# para mostrar log
```shell
docker-compose logs --follow
```

# para ver os serviços disponíveis
```shell
docker-compose ps
```

# para derrubar os serviços
```shell
docker-compose down
```

# para verificar network containers
```shell
docker network ls
```

# para entrar na maquina e verificar rede
```shell
docker exec -it sistema_csharp bash
docker exec -it sistema_java bash
docker exec -it sistema_nodejs bash
```