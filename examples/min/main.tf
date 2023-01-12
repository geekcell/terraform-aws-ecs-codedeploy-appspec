resource "aws_ecs_service" "example" {
  name             = "example"
  task_definition  = "some-task-definition:1"
  platform_version = "LATEST"

  load_balancer {
    container_name = "app"
    container_port = 80
  }

  network_configuration {
    subnets          = ["subnet-12345678", "subnet-87654321"]
    security_groups  = ["sg-12345678"]
    assign_public_ip = false
  }
}

module "example" {
  source = "../../"

  aws_ecs_service = aws_ecs_service.example
}
