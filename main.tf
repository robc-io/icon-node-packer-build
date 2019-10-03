data "aws_caller_identity" "this" {}
data "aws_region" "current" {}

terraform {
  required_version = ">= 0.12"
}

locals {
  name = var.name

  distro = var.distro
  node = var.node

  common_tags = {
    "Name" = local.name
    "Terraform"   = true
    "Environment" = var.environment
  }

  tags = merge(var.tags, local.common_tags)
}

resource "null_resource" "meta" {
  triggers = {
    apply_time = timestamp()
  }

  provisioner "local-exec" {
    command = "meta git clone `pwd`/.meta"
  }
}

resource "null_resource" "this" {
  triggers = {
    apply_time = timestamp()
  }

  provisioner "local-exec" {
    command = "./icon-node-packer-build -d ${local.distro} -n ${local.node}"
  }

  depends_on = [null_resource.meta]
}