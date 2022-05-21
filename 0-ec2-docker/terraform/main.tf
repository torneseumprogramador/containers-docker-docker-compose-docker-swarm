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
    },
    {
      description      = "Liberando HTTP"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    {
      description      = "Liberando HTTP"
      from_port        = 8080
      to_port          = 8080
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    {
      description      = "Liberando HTTP"
      from_port        = 3000
      to_port          = 3000
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    {
      description      = "Liberando HTTP"
      from_port        = 5001
      to_port          = 5001
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
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

# resource "aws_security_group" "acesso_postgre" {
#   name        = "acesso_postgre"
#   description = "acessos inbound traffic"

#   ingress = [
#     {
#       description      = "SSH from VPC"
#       from_port        = 5432
#       to_port          = 5432
#       protocol         = "tcp"
#       cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
#       # cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null
#     },
#     {
#       description      = "SSH from VPC"
#       from_port        = 5432
#       to_port          = 5432
#       protocol         = "tcp"
#       cidr_blocks      = ["172.31.0.228/32"]
#       # cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null
#     }
#   ]

#   egress = [
#     {
#       from_port        = 0
#       to_port          = 0
#       protocol         = "-1"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"],
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null,
#       description: "Libera dados da rede interna"
#     }
#   ]

#   tags = {
#     Name = "acesso postgre"
#   }
# }

# resource "aws_db_instance" "default" {
#   engine            = "postgres"
#   engine_version    = "14.1"
#   instance_class    = "db.t4g.micro"
#   name           = "pg_desafio"
#   username       = "pg"
#   password       = "pgdesafio345"
#   allocated_storage = 5 # aloca 5 GiB
#   publicly_accessible = true # libera acesso publico
#   vpc_security_group_ids = ["${aws_security_group.acesso_postgre.id}"]
#   backup_retention_period = 0 # não criar backup periódico
#   # preferred_backup_window = "07:00-09:00" # hora que vai realizar o backup
#   deletion_protection = false # não protegido para exclusão
#   skip_final_snapshot = true # não criar snapshot - caso de o erro "Error: DB Instance FinalSnapshotIdentifier is required when a final snapshot is required"
#   # final_snapshot_identifier = true # caso de o erro "Error: DB Instance FinalSnapshotIdentifier is required when a final snapshot is required"
#   tags = {
#     Name = "meu postgre"
#   }
# }

# resource "aws_security_group" "acesso_mysql" {
#   name        = "acesso_mysql"
#   description = "acessos inbound traffic"

#   ingress = [
#     {
#       description      = "SSH from VPC"
#       from_port        = 3306
#       to_port          = 3306
#       protocol         = "tcp"
#       cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
#       # cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null
#     },
#     {
#       description      = "SSH from VPC"
#       from_port        = 3306
#       to_port          = 3306
#       protocol         = "tcp"
#       cidr_blocks      = ["172.31.0.228/32"]
#       # cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"]
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null
#     }
#   ]

#   egress = [
#     {
#       from_port        = 0
#       to_port          = 0
#       protocol         = "-1"
#       cidr_blocks      = ["0.0.0.0/0"]
#       ipv6_cidr_blocks = ["::/0"],
#       prefix_list_ids = null,
#       security_groups: null,
#       self: null,
#       description: "Libera dados da rede interna"
#     }
#   ]

#   tags = {
#     Name = "acesso mysql"
#   }
# }

# resource "aws_db_instance" "mysql" {
#   engine            = "mysql"
#   engine_version    = "5.7.37"
#   instance_class    = "db.t2.micro"
#   name           = "mysql_desafio"
#   username       = "root"
#   password       = "mysqldesafio345"
#   allocated_storage = 5 # aloca 5 GiB
#   publicly_accessible = true # libera acesso publico
#   vpc_security_group_ids = ["${aws_security_group.acesso_mysql.id}"]
#   backup_retention_period = 0 # não criar backup periódico
#   # preferred_backup_window = "07:00-09:00" # hora que vai realizar o backup
#   deletion_protection = false # não protegido para exclusão
#   skip_final_snapshot = true # não criar snapshot - caso de o erro "Error: DB Instance FinalSnapshotIdentifier is required when a final snapshot is required"
#   # final_snapshot_identifier = true # caso de o erro "Error: DB Instance FinalSnapshotIdentifier is required when a final snapshot is required"
#   tags = {
#     Name = "meu postgre"
#   }
# }