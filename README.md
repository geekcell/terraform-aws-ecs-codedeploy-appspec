<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/template-terraform-module/main/docs/assets/logo.svg)](https://www.geekcell.io/)

<!--
Comment in these badges if they apply to the repository.

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-security-group)](https://github.com/geekcell/terraform-aws-security-group/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-security-group?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-security-group/releases)
[![Release](https://github.com/geekcell/terraform-aws-security-group/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-security-group/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-security-group/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-security-group/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-security-group/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-security-group/actions/workflows/linter.yaml)

### Security
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=INFRASTRUCTURE+SECURITY)

#### Cloud
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=CIS+AWS+V1.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=CIS+AWS+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=CIS+AZURE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=CIS+AZURE+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=CIS+GCP+V1.1)

##### Container
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=CIS+KUBERNETES+V1.6)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=CIS+EKS+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=CIS+GKE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=CIS+KUBERNETES+V1.5)

#### Data protection
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=SOC2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=PCI-DSS+V3.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=PCI-DSS+V3.2.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=ISO27001)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=NIST-800-53)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=HIPAA)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-security-group/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-security-group&benchmark=FEDRAMP+%28MODERATE%29)

-->

# Terraform AWS ECS CodeDeploy AppSpec Module

Terraform module which renders a valid AppSpec file from a `aws_ecs_service` and, optionally, stores it in the
SSM Parameter store. Why?

For deployments with CODE\_DEPLOY, an AppSpec file with the LoadBalancer info is required. The file is stored in
the SSM Parameter Store and can be fetched during the deployment to allow us to change these parameters after
the service has already been created. Structure is defined here:

https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-example.html#appspec-file-example-ecs

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_ecs_service"></a> [aws\_ecs\_service](#input\_aws\_ecs\_service) | A complete `aws_ecs_service` resource to extract the inputs from. | `any` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description of the SSM Parameter. | `string` | `null` | no |
| <a name="input_enable_ssm_parameter"></a> [enable\_ssm\_parameter](#input\_enable\_ssm\_parameter) | Create an AWS SSM Parameter for the rendered AppSpec. | `bool` | `true` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the SSM Parameter. | `string` | `null` | no |
| <a name="input_ssm_parameter_format"></a> [ssm\_parameter\_format](#input\_ssm\_parameter\_format) | The output format for rendered AppSpec file to write to SSM. Can be `json` or `yaml`. | `string` | `"json"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the SSM Parameter. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_appspec"></a> [appspec](#output\_appspec) | The AppSpec definition as HCL object. |
| <a name="output_appspec_json"></a> [appspec\_json](#output\_appspec\_json) | The AppSpec definition as JSON string. |
| <a name="output_appspec_yaml"></a> [appspec\_yaml](#output\_appspec\_yaml) | The AppSpec definition as YAML string. |
| <a name="output_ssm_parameter_arn"></a> [ssm\_parameter\_arn](#output\_ssm\_parameter\_arn) | The ARN of the SSM parameter containing the AppSpec definition. |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.36 |

## Resources

- resource.aws_ssm_parameter.main (main.tf#44)

# Examples
### Full
```hcl
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
```
<!-- END_TF_DOCS -->
