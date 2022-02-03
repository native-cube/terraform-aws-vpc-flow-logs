[![GitHub release (latest by date)](https://img.shields.io/github/v/release/native-cube/terraform-aws-vpc-flow-logs)](https://github.com/native-cube/terraform-aws-vpc-flow-logs/releases/latest)

# terraform-aws-vpc-flow-logs
Terraform module for enabling AWS VPC flow logs.

## Usage

```hcl
module "vpc-flow-logs" {
  source = "native-cube/vpc-flow-logs/aws"
  version = "~> 1.0.0"

  name_prefix = "native-cube-example"
  vpc_id      = "vpc-123456789"

  traffic_type = "ALL"

  tags = {
    Project = "native-cube"
  }
}
```

## Examples

* [VPC flow logs](https://github.com/native-cube/terraform-aws-vpc-flow-logs/tree/main/examples/core)

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_flow_log.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_role.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_policy_document.cloudwatch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested. | `string` | `null` | no |
| <a name="input_max_aggregation_interval"></a> [max\_aggregation\_interval](#input\_max\_aggregation\_interval) | The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: 60 seconds (1 minute) or 600 seconds (10 minutes) | `string` | `"600"` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | A prefix used for naming resources. | `string` | n/a | yes |
| <a name="input_retention_in_days"></a> [retention\_in\_days](#input\_retention\_in\_days) | Specifies the number of days you want to retain log events in the specified log group. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Default tags attached to all resources. | `map(string)` | `{}` | no |
| <a name="input_traffic_type"></a> [traffic\_type](#input\_traffic\_type) | The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL. | `string` | `"ALL"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where resources will be created and flow logs enabled. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_flow_logs_cloudwatch_group_arn"></a> [vpc\_flow\_logs\_cloudwatch\_group\_arn](#output\_vpc\_flow\_logs\_cloudwatch\_group\_arn) | The ARN specifying the log group used by Flow Logs. |
| <a name="output_vpc_flow_logs_id"></a> [vpc\_flow\_logs\_id](#output\_vpc\_flow\_logs\_id) | The Flow Log ID. |
| <a name="output_vpc_flow_logs_role_arn"></a> [vpc\_flow\_logs\_role\_arn](#output\_vpc\_flow\_logs\_role\_arn) | The ARN specifying the role used by Flow Logs. |
| <a name="output_vpc_flow_logs_role_id"></a> [vpc\_flow\_logs\_role\_id](#output\_vpc\_flow\_logs\_role\_id) | The ID specifying the role used by Flow Logs. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

See LICENSE file for full details.

## Pre-commit hooks

### Install dependencies

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs) required for `terraform_docs` hooks.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.

#### MacOS

```bash
brew install pre-commit terraform-docs tflint

brew tap git-chglog/git-chglog
brew install git-chglog
```