output "swarm-masters" {
  value = [
    for key, item in aws_instance.swarm_masters :
      "swarm-master ${key+1} - ${item.private_ip} - ssh -i /Users/danilo/Desktop/desafio_devops/chaves_desafio_kubernetes/id_rsa ubuntu@${item.public_dns} -o ServerAliveInterval=60"
  ]
}

output "output-swarm_workers" {
  value = [
    for key, item in aws_instance.swarm_workers :
      "swarm-workers ${key+1} - ${item.private_ip} - ssh -i /Users/danilo/Desktop/desafio_devops/chaves_desafio_kubernetes/id_rsa ubuntu@${item.public_dns} -o ServerAliveInterval=60"
  ]
}