module "scaleway" {
  source = "./scaleway"
}

# do not follow this path - here are the dragons.....
# https://github.com/hashicorp/terraform/issues/15249
#module "docker" {
#  source      = "./docker"
#  scaleway_ip = "${module.scaleway.public_ip}"
#}

