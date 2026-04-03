variable "cloud" {
  description = "Cloud target for the current stack."
  type        = string
  default     = "aws"

  validation {
    condition     = contains(["aws", "azure", "gcp"], lower(var.cloud))
    error_message = "cloud must be one of: aws, azure, gcp."
  }
}

variable "environment" {
  description = "Environment name (dev, qa, prod, etc)."
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Additional tags to merge into default metadata."
  type        = map(string)
  default     = {}
}