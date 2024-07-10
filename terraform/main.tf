provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"  # Replace with your desired availability zone

  tags = {
    Name = "main-subnet"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-09b5c6390225b29cc"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id

  tags = {
    Name = "ExampleInstance"
  }
}
provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-09b5c6390225b29cc"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}

