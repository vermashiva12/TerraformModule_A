resource "aws_alb_target_group" "test" {
    name = "TESTOFRTG"
    port = 80
    protocol = "HTTP"
    vpc_id = var.vpc_id
  
}
resource "aws_alb_target_group_attachment" "groupAt" {
    target_group_arn = aws_alb_target_group.test.arn
    target_id = var.machineID
  
}
resource "aws_alb" "test" {
    name = "test"
    internal = false
    load_balancer_type = "application"
    security_groups = [var.sgDB]
    subnets = [  var.publicS , var.privateS ]
  
}
resource "aws_alb_listener" "front_end" {
    load_balancer_arn = aws_alb.test.arn
    port = "80"
    protocol = "HTTP"
    default_action {
      type = "redirect"
      redirect {
        port = "443"
        protocol = "HTTPS"
        status_code = "HTTP_301"
      }
    }

  
}
resource "aws_alb_listener_rule" "albrule" {
    listener_arn = aws_alb_listener.front_end.arn
    priority = 100
    action {
      type = "forward"
      target_group_arn = aws_alb_target_group.test.arn
    }
    condition {
      path_pattern {
        values = ["/var/www/html/index.html"]
      }
    }
  
}