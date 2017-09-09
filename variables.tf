# versions
variable "docker_version" {
  default = "17.06.2~ce-0~ubuntu"
}

variable "rancher_version" {
  default = "stable"
}

# scaleway server specs

variable "region" {
  // Amsterdam "temporary out of stock"
  default = "par1"
}

variable "rancher_instance_type" {
  default = "VC1S"
}

variable "domain_name" {
  default = "angelusnovus.world"
}

# SSL
variable "ssl_email" {
  description = "E-Mail address to use for Lets Encrypt account."
}
