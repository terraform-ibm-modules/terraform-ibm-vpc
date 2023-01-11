package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/cloudinfo"
	"github.com/terraform-ibm-modules/ibmcloud-terratest-wrapper/testhelper"
)

const basicExampleTerraformDir = "examples/kp-key"
const resourceGroup = "geretain-test-kms"

var sharedInfoSvc *cloudinfo.CloudInfoService

func TestMain(m *testing.M) {
	sharedInfoSvc, _ = cloudinfo.NewCloudInfoServiceFromEnv("TF_VAR_ibmcloud_api_key", cloudinfo.CloudInfoServiceOptions{})

	os.Exit(m.Run())
}

/*
*********************************************
NOTE: this private function "setupOptions" is not required.
It helps if you have several tests that will all use a very similar
set of options.
If you have a test that uses a different set of options you can set those
up in the individual test.
***********************************************
*/
func setupOptions(t *testing.T, prefix string) *testhelper.TestOptions {

	options := testhelper.TestOptionsDefault(&testhelper.TestOptions{
		Testing:                       t,
		TerraformDir:                  basicExampleTerraformDir,
		Prefix:                        prefix,
		ResourceGroup:                 resourceGroup,
		ExcludeActivityTrackerRegions: true,
		CloudInfoService:              sharedInfoSvc,
		DefaultRegion:                 "us-south",
	})

	options.TerraformVars = map[string]interface{}{
		"ibmcloud_api_key": options.RequiredEnvironmentVars["TF_VAR_ibmcloud_api_key"],
		"ibm_region":       options.DefaultRegion,
		"resource_group":   options.ResourceGroup,
		"service_name":     fmt.Sprintf("%s-%s", options.Prefix, "kms"),
		"location":         options.DefaultRegion,
		"key_name":         fmt.Sprintf("%s-%s", options.Prefix, "kmsKey"),
	}

	return options
}

func TestRunBasicExample(t *testing.T) {
	t.Parallel()

	options := setupOptions(t, "ibm-kms-key")

	output, err := options.RunTestConsistency()
	assert.Nil(t, err, "This should not have errored")
	assert.NotNil(t, output, "Expected some output")
}

func TestRunUpgradeExample(t *testing.T) {
	t.Parallel()
	t.Skip()

	options := setupOptions(t, "ibm-kms-key-upg")

	output, err := options.RunTestUpgrade()
	if !options.UpgradeTestSkipped {
		assert.Nil(t, err, "This should not have errored")
		assert.NotNil(t, output, "Expected some output")
	}
}
