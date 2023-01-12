output "appspec" {
  description = "The AppSpec definition as HCL object."
  value       = local.appspec
}

output "appspec_json" {
  description = "The AppSpec definition as JSON string."
  value       = jsonencode(local.appspec)
}

output "appspec_yaml" {
  description = "The AppSpec definition as YAML string."
  value       = yamlencode(local.appspec)
}

output "ssm_parameter_arn" {
  description = "The ARN of the SSM parameter containing the AppSpec definition."
  value       = try(aws_ssm_parameter.main[0].arn, null)
}
