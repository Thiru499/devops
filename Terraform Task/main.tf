provider "aws" {
  alias  = "us_east"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us_west"
  region = "us-west-2"
}

resource "aws_instance" "us_east_instance" {
  provider      = aws.us_east
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 for us-east-1
  instance_type = "t2.micro"

  tags = {
    Name = "EastInstance"
  }
}

resource "aws_instance" "us_west_instance" {
  provider      = aws.us_west
  ami           = "ami-0e34e7b9ca0ace12d" # Amazon Linux 2 for us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "WestInstance"
  }
}
