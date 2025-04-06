provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "usw2"
  region = "us-west-2"
}

# -------------------
# EC2 in us-east-1
# -------------------
resource "aws_instance" "east_instance" {
  provider      = aws.use1
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 in us-east-1
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y nginx1
              systemctl start nginx
              systemctl enable nginx
            EOF

  tags = {
    Name = "East-Nginx"
  }
}

# -------------------
# EC2 in us-west-2
# -------------------
resource "aws_instance" "west_instance" {
  provider      = aws.usw2
  ami           = "ami-0e34e7b9ca0ace12d" # Amazon Linux 2 in us-west-2
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              amazon-linux-extras install -y nginx1
              systemctl start nginx
              systemctl enable nginx
            EOF

  tags = {
    Name = "West-Nginx"
  }
}
