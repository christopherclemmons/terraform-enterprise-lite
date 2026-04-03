# terraform-enterprise-lite

Enterprise-ready Terraform/OpenTofu boilerplate for large teams.

This repository is cloud-agnostic by design and currently includes an AWS starter stack under `examples/aws-starter`.

## Work In Progress

This project is actively being built and is still a work in progress. Features, interfaces, and defaults may change without notice.

## Open Source Notice

This project is open source and provided to the community for learning, experimentation, and production hardening.

## What This Template Includes

- Security scanning:
  - Checkov
  - Trivy
- Quality control:
  - TFLint
- Formatting and validation:
  - Terraform
  - OpenTofu
- CI:
  - GitHub Actions workflows
- Git hooks:
  - Pre-Commit framework
- Version management:
  - `tenv` with repository version files
- Testing:
  - Terraform Testing Framework (`terraform test`)
  - Terratest (Go)

## Repository Layout

- `main.tf`, `variables.tf`, `outputs.tf`, `versions.tf`: cloud-agnostic base module
- `examples/aws-starter`: AWS-first usage example
- `.pre-commit-config.yaml`: Git hooks for fmt/validate/lint/security checks
- `.github/workflows/ci.yml`: CI for formatting, validation, linting, and testing
- `.github/workflows/security.yml`: dedicated security scans
- `tests/basic.tftest.hcl`: Terraform Testing Framework suite
- `tests/terratest`: Terratest suite

## Version Management with tenv

This repository uses:

- `.terraform-version`
- `.opentofu-version`

Both are set to `latest-allowed`, so tenv resolves the latest compatible version from the `required_version` constraint in `versions.tf`.

### Local Setup

1. Install `tenv`.
2. Install tool versions:

```bash
tenv tf install "$(cat .terraform-version)"
tenv tofu install "$(cat .opentofu-version)"
tenv update-path
```

3. Verify:

```bash
terraform version
tofu version
```

## Pre-Commit Hooks

Install and run hooks:

```bash
pip install pre-commit
pre-commit install
pre-commit run --all-files
```

Configured hooks cover:

- `terraform fmt` and `tofu fmt`
- `terraform validate` and `tofu validate`
- `tflint`
- `checkov`
- `trivy`

## CI Workflows

### `ci.yml`

Runs on pull requests and pushes to `main`:

- Terraform/OpenTofu format checks
- Terraform/OpenTofu validation (root + AWS starter)
- TFLint recursive lint
- Terraform Testing Framework tests
- Terratest suite

### `security.yml`

Runs dedicated security scanning:

- Checkov
- Trivy IaC misconfiguration scan

## Manual Commands (Local)

A `Makefile` is included:

```bash
make bootstrap
make fmt-check
make validate
make lint
make scan
make test
```

## AWS Starter Example

`examples/aws-starter` demonstrates how to consume the cloud-agnostic base with AWS provider wiring.

Example:

```bash
cd examples/aws-starter
terraform init
terraform plan -var-file=terraform.tfvars.example
```

## Disclaimer and Liability

This software is provided "AS IS", without warranties or guarantees of any kind.

By using this repository, you agree that the maintainers and contributors are not responsible or liable for any damages, losses, incidents, outages, compliance failures, or other liabilities resulting from its use or misuse.

You are solely responsible for validating security, compliance, reliability, and fitness for your specific environment before production use.

## License

Licensed under the MIT License. See [LICENSE](LICENSE).

## Next Extension Points

- Add `examples/azure-starter` and `examples/gcp-starter`
- Add policy-as-code gates (OPA/Conftest or Sentinel)
- Add environment promotion workflow (dev -> qa -> prod)
- Add reusable shared modules under `modules/`
