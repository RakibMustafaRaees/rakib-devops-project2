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

