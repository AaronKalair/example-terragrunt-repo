
terraform {
  source = "git@github.com:aaronkalair/terraform-module-cache?ref=v1.0.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  module_specific_variable = "amazing"
}
