provider "aws" {
  region = "eu-west-1"
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
