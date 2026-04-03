.PHONY: bootstrap fmt fmt-check validate lint scan test test-framework test-terratest pre-commit-install pre-commit-run

bootstrap:
	tenv tf install "$$(cat .terraform-version)"
	tenv tofu install "$$(cat .opentofu-version)"
	tenv update-path

fmt:
	terraform fmt -recursive
	tofu fmt -recursive

fmt-check:
	terraform fmt -check -recursive
	tofu fmt -check -recursive

validate:
	terraform init -backend=false -input=false
	terraform validate
	tofu init -backend=false -input=false
	tofu validate

lint:
	tflint --init
	tflint --recursive

scan:
	checkov -d . --config-file .checkov.yaml
	trivy config --config trivy.yaml .

test: test-framework test-terratest

test-framework:
	terraform test -test-directory=tests

test-terratest:
	cd tests/terratest && go test ./... -v

pre-commit-install:
	pre-commit install

pre-commit-run:
	pre-commit run --all-files