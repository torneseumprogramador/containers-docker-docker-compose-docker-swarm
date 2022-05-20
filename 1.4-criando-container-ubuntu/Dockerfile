FROM ubuntu:20.04
RUN apt update
RUN apt upgrade -y
RUN apt install ruby -y
RUN apt install default-jdk -y
RUN apt install apache2 -y
RUN apt install mysql-server -y
RUN apt install vim -y
RUN apt install git -y
RUN apt install nodejs -y
RUN apt install npm -y
COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
RUN git clone https://github.com/torneseumprogramador/treinamento-integracao-continua.git
RUN cd treinamento-integracao-continua 
WORKDIR  treinamento-integracao-continua
RUN npm install
CMD ["node", "./bin/www"]
# EXPOSE 3306