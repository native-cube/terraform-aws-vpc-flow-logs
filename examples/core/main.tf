provider "aws" {
  region = "eu-west-2"
}

terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.41"
    }
  }
}

module "flow-logs" {
  source = "../../"

  name_prefix = "native-cube-example"
  vpc_id      = "vpc-123456789"

  traffic_type = "ALL"
  # retention_in_days = 30
  # max_aggregation_interval = 60

  tags = {
    Environment = "test"
    Project     = "native-cube"
  }
}
