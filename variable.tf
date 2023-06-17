variable "external_ip" {
  type    = string
  default = "0.0.0.0/0"
}

variable "instance-type" {
  type    = string
  default = "t3.micro"
}

# Create key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "wordpress-key" {
  key_name   = "wordpress-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

variable "profile" {
  type    = string
  default = "default"
}

variable "ami-ubuntu" {
  type    = string
  default = "ami-053b0d53c279acc90"
}

variable "region-master" {
  type    = string
  default = "us-east-1"
}

variable "mysql_password" {
  type = string
  default = "password"
  # sensitive = true
}