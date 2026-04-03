terraform {
  required_version = ">= 1.6.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "platform" {
  source      = "../../"
  cloud       = "aws"
  environment = var.environment
  tags        = var.tags
}

output "platform_metadata" {
  value = module.platform.platform_metadata
}