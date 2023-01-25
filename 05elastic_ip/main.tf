provider "aws" {
    region = "us-east-1" 
}

resource "aws_instance" "ec2" {
    ami = "ami-0b5eea76982371e91"
    instance_type = "t2.micro"

    tags = {
        Name = "EIPEC2"
    }
}

resource "aws_eip" "elasticip" {
    instance = aws_instance.ec2.id

    tags = {
        Name = "ec2 EIP"
    }
}

output "EIP" {
    value = aws_eip.elasticip.public_ip
}