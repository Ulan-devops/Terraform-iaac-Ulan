instance_type                   =       "t2.large"
key_name                        =       "ulans"
ami                             =       "ami-0ff760d16d9497662"  # Centos7  image
vpc_id                          =       "vpc-fa750980"
user                            =       "centos"
ssh_key_location                =       "~/.ssh/id_rsa"        #Import pub key pair to aws as "terraform"
zone_id                         =       "Z11HUQ2CPZZDNC"           #Add hosted DNS zone ID here
domain                          =       "ulan-best.com."
region                          =       "us-east-1"
