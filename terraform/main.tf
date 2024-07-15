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
  ami           = "ami-0103953a003440c37"  # Replace with a valid AMI ID for your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
  associate_public_ip_address = true  # Ensure the instance gets a public IP
  
  key_name = "rakib-devops-key"  # Replace with the name of your key pair

  tags = {
    Name = "ExampleInstance"
  }

#  provisioner "file" {
#    source      = "${path.module}/ansible/playbook.yml"
#    destination = "/home/ubuntu/ansible/playbook.yml"
    
#    connection {
#      type     = "ssh"
#      user     = "ubuntu"
#      private_key = base64decode(var.private_key)  # Path to your private key
#      host     = self.public_ip
#    }
#  }

  provisioner "local-exec" {
    environment = {
      ANSIBLE_HOST_KEY_CHECKING = "False"
    }
    command = <<EOT
#     sudo mkdir -p /etc/ansible  # Ensure the directory exists
#     sudo apt-get update -y
#     sudo apt-get install -y ansible
#     echo "[example]" > /etc/ansible/hosts
#     echo "${self.public_ip}" >> /etc/ansible/hosts  # Correctly reference the public IP
#     ansible-playbook /home/ubuntu/ansible/playbook.yml  # Correct path to the playbook
      sleep 60  # Adding a delay to allow the instance to initialize

      ansible-playbook -i '${self.public_ip},' --private-key ~/.ssh/id_rsa -u ubuntu ~/Desktop/rakib-devops-project2/ansible/playbook.yml

    EOT
  }
}

