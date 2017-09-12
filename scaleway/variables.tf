# scaleway server specs

variable "my_region" {
  // Amsterdam "temporary out of stock"
  default = "par1"
}

variable "my_architecture" {
  default = "x86_64"
}

variable "my_bootscript" {
  default = "x86_64 mainline 4.12.11 rev1"
}

variable "my_image" {
  default = "Ubuntu Xenial"
}

variable "my_instance_type" {
  default = "VC1S"
}

variable "my_domain_name" {
  default = "angelusnovus.world"
}
