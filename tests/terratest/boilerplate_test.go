package terratest

import (
	"path/filepath"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestRootModuleInitAndValidate(t *testing.T) {
	t.Parallel()

	repoRoot, err := filepath.Abs("../..")
	if err != nil {
		t.Fatalf("failed to resolve repo root: %v", err)
	}

	terraformOptions := &terraform.Options{
		TerraformDir: repoRoot,
		NoColor:      true,
	}

	terraform.RunTerraformCommand(t, terraformOptions, "init", "-backend=false", "-input=false")
	terraform.RunTerraformCommand(t, terraformOptions, "validate")
}