# Go to us-east-2 instances. Wt create with the latest  ami from scratch a new instance called Hello World
provider "aws" {
    region = "us-east-2" 
} 

# search for Ubuntu latest with the owner
data "aws_ami" "ubuntu" {
    filter {
        name = "root-device-type"
        values = ["ebs"]
        }
    most_recent = true
    owners = ["099720109477"]
    }
# Show the ami id
output "ami" { 
    value = "${data.aws_ami.ubuntu.id}" 
} 
# so data source collects us a new ami

resource "aws_instance" "web" {
  ami           = "${data.aws_ami.ubuntu.id}"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}}