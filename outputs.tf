output "autoscaling"{
    description = "Autoscaling Group ID"
    value = aws_autoscaling_group.web-asg.id
}

output "configuration"{
    description = "Launch Configuration ID"
    value = aws_launch_configuration.web-lc.id
}

output "security"{
    description="Security group ID"
    value = aws_security_group.instances-sg.id
}

output "keypair" {
    description = "Generated key"
    value = aws_key_pair.generated_key
}