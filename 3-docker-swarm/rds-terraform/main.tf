provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "acesso_mysql" {
  name        = "acesso_mysql"
  description = "acessos inbound traffic"

  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
    #   cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = null,
      security_groups: null,
      self: null
    },
    {
      description      = "SSH from VPC"
      from_port        = 3306
      to_port          = 3306
      protocol         = "tcp"
      cidr_blocks      = ["172.31.0.228/32"]
      # cidr_blocks      = ["0.0.0.0/0"]
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
    Name = "acesso mysql"
  }
}

resource "aws_db_instance" "mysql" {
  engine            = "mysql"
  engine_version    = "5.7.37"
  instance_class    = "db.t2.micro"
  name           = "mysql_desafio"
  username       = "root"
  password       = "mysqldesafio345"
  allocated_storage = 5 # aloca 5 GiB
  publicly_accessible = false # libera acesso publico
  vpc_security_group_ids = ["${aws_security_group.acesso_mysql.id}"]
  backup_retention_period = 0 # não criar backup periódico
  # preferred_backup_window = "07:00-09:00" # hora que vai realizar o backup
  deletion_protection = false # não protegido para exclusão
  skip_final_snapshot = true # não criar snapshot - caso de o erro "Error: DB Instance FinalSnapshotIdentifier is required when a final snapshot is required"
  # final_snapshot_identifier = true # caso de o erro "Error: DB Instance FinalSnapshotIdentifier is required when a final snapshot is required"
  tags = {
    Name = "meu postgre"
  }
}