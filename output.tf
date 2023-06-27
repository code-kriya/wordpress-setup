output "instance_ip" {
  value = aws_instance.wordpress-server.public_ip
}
