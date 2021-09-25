terraform {
  source = "git@github.com:aaronkalair/terraform-module-s3-bucket?ref=testing-branch"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  bucket_name = "app-a"
}
