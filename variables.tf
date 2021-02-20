#---------------------------------------------
#                 Commons
#---------------------------------------------

variable "region"{
    description = "AWS Region"
    type = string
}

#---------------------------------------------
#           Launch Configuration
#---------------------------------------------

variable "instance_type"{
    description = "Instance Type"
    type = string
}

variable "ami"{
    description = "Autoscaling Group instances AMI"
    type = string
}