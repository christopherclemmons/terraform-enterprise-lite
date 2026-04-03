variable "aws_region" {
  description = "AWS region for this stack."
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Stack-specific tags."
  type        = map(string)
  default     = {}
}