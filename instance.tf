resource "aws_instance" "wordpress-server" {
  ami                         = var.ami-ubuntu
  instance_type               = var.instance-type
  key_name                    = aws_key_pair.wordpress-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.wordpress-server.id]


  provisioner "local-exec" {
    command = <<EOF
aws --profile ${var.profile} ec2 wait instance-status-ok --region ${var.region-master} --instance-ids ${self.id} \
&& ansible-playbook --extra-vars 'passed_in_hosts=${self.public_ip} user_name=ubuntu mysql_password=${var.mysql_password}' ansible_playbooks/site.yaml
EOF
  }

  tags = {
    Name = "wordpress-server"
  }
}
