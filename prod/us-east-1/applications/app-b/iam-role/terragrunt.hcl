terraform {
  source = "git@github.com:aaronkalair/terraform-iam-role.git?ref=1.2.0"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  allowed_actions = ["ec2:describeInstance"]
  allowed_resources = ["*"]
}
