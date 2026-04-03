locals {
  normalized_cloud = lower(var.cloud)

  default_tags = {
    managed_by  = "terraform-enterprise-lite"
    environment = var.environment
    cloud       = local.normalized_cloud
  }

  merged_tags = merge(local.default_tags, var.tags)
}