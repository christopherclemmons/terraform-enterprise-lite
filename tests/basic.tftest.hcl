run "defaults_are_safe" {
  command = plan

  assert {
    condition     = local.normalized_cloud == "aws"
    error_message = "Expected default cloud to be aws."
  }

  assert {
    condition     = local.merged_tags["managed_by"] == "terraform-enterprise-lite"
    error_message = "managed_by tag must be set by default."
  }
}

run "explicit_cloud_and_tags" {
  command = plan

  variables {
    cloud       = "gcp"
    environment = "qa"
    tags = {
      owner = "platform-team"
    }
  }

  assert {
    condition     = local.normalized_cloud == "gcp"
    error_message = "Expected cloud override to be honored."
  }

  assert {
    condition     = local.merged_tags["owner"] == "platform-team"
    error_message = "Expected custom tag to be merged."
  }
}