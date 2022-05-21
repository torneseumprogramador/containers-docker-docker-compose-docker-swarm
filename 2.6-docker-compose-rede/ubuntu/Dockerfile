FROM ubuntu:20.04
RUN apt update
RUN apt install telnet -y
RUN apt install iputils-ping -y
RUN apt install curl -y
RUN apt install ssh -y

EXPOSE 22

CMD ["sleep", "3600"]