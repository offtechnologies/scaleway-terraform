module "scaleway" {
  source = "./scaleway"
}

#module "docker" {
#  source      = "./docker"
#  scaleway_ip = "${module.scaleway.public_ip}"
#}

