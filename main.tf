provider "scaleway" {
  region = "${var.region}"
}

data "scaleway_bootscript" "mainline" {
  architecture = "x86_64"
  name_filter  = "x86_64 mainline 4.12.11 rev1"
}

data "scaleway_image" "xenial" {
  architecture = "x86_64"
  name         = "Ubuntu Xenial"
}
