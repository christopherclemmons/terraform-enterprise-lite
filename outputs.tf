output "platform_metadata" {
  description = "Normalized metadata emitted by the platform baseline."
  value = {
    cloud       = local.normalized_cloud
    environment = var.environment
    tags        = local.merged_tags
  }
}