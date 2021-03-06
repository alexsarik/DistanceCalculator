#---------------------------------------------
#                 Commons
#---------------------------------------------

variable "region" {
  description = "AWS Region"
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones for the Autoscaling Group"
  type        = list(string)
}

#---------------------------------------------
#           Launch Configuration
#---------------------------------------------

variable "instance_type" {
  description = "Instance Type"
  type        = string
}

variable "ami" {
  description = "Autoscaling Group instances AMI"
  type        = string
}

#---------------------------------------------
#            Autoscaling Group
#---------------------------------------------

variable "asg_name" {
  description = "Autoscaling Group name"
  type        = string
}

variable "asg_max_size" {
  description = "Autoscaling Group max number of instances"
  type        = number
}

variable "asg_min_size" {
  description = "Autoscaling Group min number of instances"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Autoscaling Group desired number of instances"
  type        = number
}

variable "force_delete" {
  description = "Autoscaling Group force delete condition"
  type        = bool
}

variable "propagate_at_launch" {
  description = "Autoscaling Group tags propagate at launch condition"
  type        = bool
}

#---------------------------------------------
#                 RSA Key
#---------------------------------------------

variable "key_name" {
  description = "RSA key name"
  type        = string
}

variable "algorithm" {
  description = "key algorithm"
  type        = string
  default     = "RSA"
}
variable "rsa_bits" {
  description = "RSA bits"
  type        = number
}
