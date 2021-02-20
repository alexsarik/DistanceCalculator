data "template_file" "distance-calculator"{
    template = file("template.tpl")
    vars = {
        port = 80
    }
}

resource "aws_launch_configuration" "web-lc"{
    name            = "launch configuration"
    image_id        = var.ami
    instance_type   = var.instance_type
    user_data       = data.template_file.distance-calculator.rendered
    security_groups = [aws_security_group.instances-sg.id]
}

resource "aws_autoscaling_group" "web-asg"{
    availability_zones      = var.availability_zones
    name                    = var.asg_name
    max_size                = var.asg_max_size
    min_size                = var.asg_min_size
    desired_capacity        = var.asg_desired_capacity
    force_delete            = var.force_delete
    launch_configuration    = aws_launch_configuration.web-lc.name

    tags = concat(
    [
      {
        key                 = "Author"
        value               = "Alexander Sari"
        propagate_at_launch = var.propagate_at_launch
      },
      { key                 = "Date"
        value               = "19/02/2021"
        propagate_at_launch = var.propagate_at_launch
      },
    ],
  )
}

resource "tls_private_key" "rsa-key" {
  algorithm = var.algorithm
  rsa_bits  = var.rsa_bits
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa-key.public_key_openssh
}