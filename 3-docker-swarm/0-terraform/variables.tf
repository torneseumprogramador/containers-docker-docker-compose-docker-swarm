variable key_pair_name {
  type        = string
  default     = "chave_publica_desafio_kubernetes"
}

variable subnet-az-a {
  type        = string
  default     = "subnet-1fa24744"
}

variable vpc_id {
  type        = string
  default     = "vpc-f0d19897"
  description = "description"
}

variable meu_nome {
  type        = string
  default     = "lab-swarms"
  description = "Nome recurso"
}