# Go to us-east-2 instances
provider "aws" { 
  region = "us-east-2" 
} 

# search for Ubuntu latest with the owner
data "aws_ami" "ubuntu" { 
  most_recent = true 
  owners = ["099720109477"] 

} 
# Show the ami id
output "ami" { 
  value = "${data.aws_ami.ubuntu.id}" 
} 