/**
 * # Terraform AWS ECS CodeDeploy AppSpec Module
 *
 * Terraform module which renders a valid AppSpec file from a `aws_ecs_service` and, optionally, stores it in the
 * SSM Parameter store. Why?
 *
 * For deployments with CODE_DEPLOY, an AppSpec file with the LoadBalancer info is required. The file is stored in
 * the SSM Parameter Store and can be fetched during the deployment to allow us to change these parameters after
 * the service has already been created. Structure is defined here:
 *
 * https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-example.html#appspec-file-example-ecs
 */
locals {
  appspec = {
    version = 0.0
    Resources = [
      {
        TargetService = {
          Type = "AWS::ECS::Service"
          Properties = {
            TaskDefinition = var.aws_ecs_service.task_definition

            LoadBalancerInfo = {
              ContainerName = tolist(var.aws_ecs_service.load_balancer)[0].container_name
              ContainerPort = tolist(var.aws_ecs_service.load_balancer)[0].container_port
            }

            PlatformVersion = var.aws_ecs_service.platform_version

            NetworkConfiguration = {
              AwsvpcConfiguration = {
                Subnets        = var.aws_ecs_service.network_configuration[0].subnets
                SecurityGroups = var.aws_ecs_service.network_configuration[0].security_groups
                AssignPublicIp = var.aws_ecs_service.network_configuration[0].assign_public_ip ? "ENABLED" : "DISABLED"
              }
            }
          }
        }
      }
    ]
  }
}

resource "aws_ssm_parameter" "main" {
  count = var.enable_ssm_parameter ? 1 : 0

  name        = var.name
  description = var.description
  type        = "String"
  value       = var.ssm_parameter_format == "json" ? jsonencode(local.appspec) : yamlencode(local.appspec)

  tags = var.tags
}
