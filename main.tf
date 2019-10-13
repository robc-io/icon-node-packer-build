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
    command = "meta git clone ."
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

data "aws_ami" "ami_id" {
  most_recent = true

  tags = {
    Name   = local.node
    Distro = local.distro
  }

  owners = ["self"]

  depends_on = [null_resource.this]
}

