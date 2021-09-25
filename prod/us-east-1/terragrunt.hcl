remote_state {
  backend = "s3"
  config = {
    bucket         = "company-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "company-terraform-locks"
  }
}

inputs = merge(
  yamldecode(
    file("${find_in_parent_folders("environment.yaml", find_in_parent_folders("environment.yaml"))}"),
  ),
  yamldecode(
    file("${find_in_parent_folders("region.yaml", find_in_parent_folders("environment.yaml"))}"),
  ),
  yamldecode(
    file("${find_in_parent_folders("app.yaml", find_in_parent_folders("environment.yaml"))}"),
  ),
)

generate "aws_provider" {
  path      = "aws_provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "us-east-1"
}
EOF
}
