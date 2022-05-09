FROM didox/lion:prod
RUN apt update
RUN apt install git -y

COPY ssh/* /home/app/.ssh/
COPY ssh/* /root/.ssh/

COPY pull.sh /home/app/pull.sh
COPY pull.sh /root/pull.sh

# copiar o projeto interno do irpronto e colocar no diretório aqui, para fazer a cópia do .git, exemplo: git clone git@github.com:liontax/irpronto_inside_docker-prod.git
COPY git /built_app/.git 
