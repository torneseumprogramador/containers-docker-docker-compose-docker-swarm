# Docker
- Docker é um conjunto de produtos de plataforma como serviço (PaaS) que usam virtualização de nível de sistema operacional para entregar software em pacotes chamados contêineres. Os contêineres são isolados uns dos outros e agrupam seus próprios softwares, bibliotecas e arquivos de configuração. Eles podem se comunicar uns com os outros por meio de canais bem definidos. Todos os contêineres são executados por um único kernel do sistema operacional e, portanto, usam menos recursos do que as máquinas virtuais.
- https://www.docker.com/

#### Build Docker
```shell
docker build -t didox/SEU_APP -f Dockerfile .
```

### Build Docker and run
```shell
docker run -d -p 80:3000 --name SEU_CONTAINER didox/SEU_APP
```

### Build watch Docker
```shell
docker run -it -p 80:3000 --name SEU_CONTAINER didox/SEU_APP
```

# Para subir app no docker
```shell
docker start SEU_CONTAINER
```

# Para parar o docker
```shell
docker stop SEU_CONTAINER
```

### Lista processos ativos
```shell
docker ps
```

### Lista todos os containers
```shell
docker ps -a
```

### para remover a imagem do docker
```shell
docker rm SEU_CONTAINER
```

### para depurar
```shell
docker attach SEU_CONTAINER
```

### entra dentro do container
```shell
docker exec -it SEU_CONTAINER bash
docker exec -it SEU_CONTAINER /bin/sh
docker exec -it SEU_CONTAINER /bin/bash
```

### roda comando dentro do container
```shell
docker exec -it SEU_CONTAINER ls -la
```

### para ver logs
```shell
docker logs SEU_CONTAINER -f --tail 100
```

### Gerar a tag da imagem no docker hub, coloca como latest
```shell
docker tag didox/SEU_APP hub.docker.com/r/didox/SEU_APP
```

### Gerar a tag da imagem no docker hub, com tag 0.0.1
```shell
docker tag didox/SEU_APP hub.docker.com/r/didox/SEU_APP:0.0.1
```

### Publicar a imagem no docker hub, para o latest
```shell
docker push didox/SEU_APP
```

### Publicar a imagem no docker hub, para o tag 
```shell
docker push didox/SEU_APP:0.0.1
```

### Remover imagem
```shell
docker image rm didox/SUA_IMG
```

### Ver imagens
```shell
docker image ls
```

# Docker Compose
- Docker Compose ajuda a definir e compartilhar aplicativos com vários contêineres. Com Docker Compose, você pode criar um arquivo para definir os serviços. Com um único comando, você pode girar tudo ou desmontar tudo.

### para buildar imagem
```shell
docker-compose build
```

### para criar e levantar
```shell
docker-compose up
docker-compose up --detach # roda em background
```

### para levantar
```shell
docker-compose start
```

### para derrubar
```shell
docker-compose stop
```

### para mostrar log
```shell
docker-compose logs --follow
```

### para ver os serviços disponíveis
```shell
docker-compose ps
```

### para derrubar os serviços
```shell
docker-compose down
```

### para verificar network containers
```shell
docker network ls
```

### para entrar na maquina e verificar rede
```shell
docker exec -it sistema_csharp bash
docker exec -it sistema_java bash
docker exec -it sistema_nodejs bash
```
