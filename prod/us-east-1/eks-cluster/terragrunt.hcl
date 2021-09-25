terraform {
  source = "git@github.com:aaronkalair/terraform-eks-cluster.git?ref=3.2.0"
}

include {
  path = find_in_parent_folders()
}
