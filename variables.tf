variable "name" {
  type = string
  default = "node-configuration"
}

variable "distro" {
  type = string
  description = "The distro, ie - debian-9, ubuntu-18"
}

variable "node" {
  type = string
  description = "the node type of node, citizen, p-rep"
}

variable "tags" {
  description = "Tags that are appended"
  type = map(string)
  default = {}
}
