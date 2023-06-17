
resource "aws_security_group" "wordpress-server" {
  name = "wordpress-server-sg"
}

resource "aws_security_group_rule" "all_outbound_traffic" {
  type              = "egress"
  security_group_id = aws_security_group.wordpress-server.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.wordpress-server.id

  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_tcp_connection" {
  type              = "ingress"
  security_group_id = aws_security_group.wordpress-server.id

  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

