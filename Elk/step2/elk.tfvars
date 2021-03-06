instance_type           =       "t2.medium"
key_name                        =       "laptop"
ami                                 =   "ami-02eac2c0129f6376b"    #Use Centos7  image
vpc_id                          =       "vpc-fa750980"
user                            =       "centos"
ssh_key_location        =       "/root/.ssh/id_rsa"        #Import pub key pair to aws as "terraform"
zone_id                         =       "Z11HUQ2CPZZDNC"           #Add hosted DNS zone ID here
domain                          =       "ulan-best.com."
region                          =       "us-east-1"
