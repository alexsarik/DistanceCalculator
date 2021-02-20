#---------------------------------------------
#                 Commons
#---------------------------------------------

region             = "eu-west-1"

#---------------------------------------------
#           Launch Configuration
#---------------------------------------------

instance_type = "t2.micro"

ami           = "ami-0fc970315c2d38f01"

#---------------------------------------------
#            Autoscaling Group
#---------------------------------------------

asg_name             = "asg-distance-calculator"

asg_max_size         = 5

asg_min_size         = 1

asg_desired_capacity = 2

force_delete         = true

propagate_at_launch  = true

#---------------------------------------------
#                 RSA Key
#---------------------------------------------

key_name  = "test-key"

algorithm = "RSA"

rsa_bits  = 409