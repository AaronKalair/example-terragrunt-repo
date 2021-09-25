terraform {
  source = "git@github.com:aaronkalair/terraform-module-database?ref=v3.0.0"
}

include {
  path = find_in_parent_folders()
}

locals {
  env_vars = yamldecode(
    file("${find_in_parent_folders("environment.yaml")}"),
  )
}

dependency "eks_cluster" {
  config_path = "../../eks-cluster"

inputs = {
  env_name = local.env_vars['environment_name']
  # This is a very unimportant database, we want to run it on super cheap storage
  database_storage_type = standard
  # Database needs the ID of the Security Group attached to the K8s workers
  # so it can allow access from it
  dependency.eks_cluster.outputs.worker_sg_id
}
