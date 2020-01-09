# Go to us-east-2 instances. Wt create with the latest  ami from scratch a new instance called Hello World
provider "aws" {
    region = "us-east-1" 
} 

# search for Ubuntu latest with the owner
data "aws_ami" "centos" {
    filter {
        name = "root-device-type"
        values = ["ebs"]
        }
    filter {
        name = "name"
        values = ["CentOS Linux 7 x86_64 HVM EBS *"]
        }
    most_recent = true
    owners = ["679593333241"]
    }
# Show the latest ami id
output "ami" { 
    value = data.aws_ami.centos.id
} 

resource "aws_key_pair" "towerkey" { 
  key_name   = "towerkey" 
  public_key = file("~/.ssh/id_rsa.pub") 
} 


# so data source collects us a new ami

resource "aws_instance" "tower" {
  ami           = data.aws_ami.centos.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.towerkey.key_name
  provisioner "remote-exec" {
    connection {
      host = self.public_ip
      type = "ssh"
      user = "centos" 
      private_key = file("~/.ssh/id_rsa")
      }
    inline = [
      "sudo yum install -y epel-release", 
    ] 
  }
  tags = {
    Name = "HelloWorld"
  }
}


# here we added a new route53 record and hosted zone id from your route53

resource "aws_route53_record" "tower" { 
  zone_id = "Z11HUQ2CPZZDNC" 
  name    = "tower.example.com" 
  type    = "A" 
  ttl     = "300" 
  records = [aws_instance.web.public_ip] 
} 