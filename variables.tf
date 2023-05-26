## NAMING
variable "name" {
  description = "Name of the SSM Parameter."
  default     = null
  type        = string
}

variable "description" {
  description = "Description of the SSM Parameter."
  default     = null
  type        = string
}

variable "tags" {
  description = "Tags to add to the SSM Parameter."
  default     = {}
  type        = map(any)
}

## APPSPEC
variable "aws_ecs_service" {
  description = "A complete `aws_ecs_service` resource to extract the inputs from."
  type        = any
}

## SSM PARAMETER
variable "ssm_parameter_format" {
  description = "The output format for rendered AppSpec file to write to SSM. Can be `json` or `yaml`."
  default     = "json"
  type        = string

  validation {
    condition     = contains(["json", "yaml"], var.ssm_parameter_format)
    error_message = "Value must be `json` or `yaml`."
  }
}

variable "enable_ssm_parameter" {
  description = "Create an AWS SSM Parameter for the rendered AppSpec."
  default     = true
  type        = bool
}
