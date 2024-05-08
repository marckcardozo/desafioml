module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = "eks-alb"

  load_balancer_type = "application"

  vpc_id             = "vpc-0f5ad0747d4306e52"
  subnets            = ["subnet-0a5a5fe8b30a3b518", "subnet-0af75f9c79fb5ac17"]
  security_groups    = ["sg-0198a71a197d6b1b1", "sg-078dab3e0957afb32"]
  internal           = false
  target_groups = [
    {
      name_prefix      = "tg-"
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        my_target1 = {
          target_id = "i-0bf37832bb715d0ab"
          port = 30001
        }
        my_target2 = {
          target_id = "i-0bf37832bb715d0ab"
          port = 30002
        }
        my_target3 = {
          target_id = "i-0bf37832bb715d0ab"
          port = 30003
        }
        my_target4 = {
          target_id = "i-0bf37832bb715d0ab"
          port = 30004
        }
      }
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
    }
  ]

  tags = {
    Environment = "Test"
  }
}