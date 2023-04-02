##### THIS FILE MANAGES ALL ELB-RELATED RESOURCES #####

################### target groups #####################
# target group for the ELB named "main" #
resource "aws_lb_target_group" "main_elb" {
  name        = "hw-main-elb"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "instance" # the default target_type
}

######################## ELBs #########################
# creating the elb #
resource "aws_lb" "main" {
  name               = "hw-main-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main-elb.id]
  subnets            = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
}

##################### listeners #######################

/* IF YOU HAVE A SSL CERTIFICATE,
 ENABLE THIS SECTION AND 
 DISABLE THE NEXT SECTION ("aws_lb_listener" "main_not_secure") */

# # create a secure listener on port 443
# resource "aws_lb_listener" "main_secure" {
#   load_balancer_arn = aws_lb.main.arn
#   port              = "443"
#   protocol          = "HTTPS"
#   ssl_policy        = "ELBSecurityPolicy-2016-08"
#   certificate_arn   = var.CERTIFICATE_ARN

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.main_elb.arn
#   }
# }

# # create a listener on port 80 to redirect to the secure listener on port 443
# resource "aws_lb_listener" "main_redirect_secure" {
#   load_balancer_arn = aws_lb.main.arn
#   port              = "80"
#   protocol          = "HTTP"

#   default_action {
#     type = "redirect"

#     redirect {
#       port        = "443"
#       protocol    = "HTTPS"
#       status_code = "HTTP_301"
#     }
#   }
# }

# # create a not-secure listener on port 80
resource "aws_lb_listener" "main_not_secure" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main_elb.arn
  }
}
