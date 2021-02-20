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

