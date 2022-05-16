provider "aws" {
  region = "us-east-1"
}

data "http" "myip" {
  url = "http://ipv4.icanhazip.com" # outra opção "https://ifconfig.me"
}

resource "aws_instance" "maquina_docker" {
  ami           = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  key_name      = "chave_publica_desafio_kubernetes"
  tags = {
    Name = "maquina_docker"
  }
  vpc_security_group_ids = [aws_security_group.acessos_docker.id]
}

resource "aws_security_group" "acessos_docker" {
  name        = "acessos_docker"
  description = "acessos inbound traffic"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"],
      prefix_list_ids = null,
      security_groups: null,
      self: null,
      description: "Libera dados da rede interna"
    }
  ]

  tags = {
    Name = "acesso ssh maquina docker"
  }
}

output "aws_instance_e_ssh" {
  value = aws_instance.maquina_docker.public_dns
}
