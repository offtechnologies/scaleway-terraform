# do not follow this path - here are the dragons.....
# https://github.com/hashicorp/terraform/issues/15249

variable "scaleway_ip" {
  default = "${scaleway_ip.my_server_ip.0.ip}"
}

#provider "docker" {
#  host = "tcp://${var.scaleway_ip}:2375/" # host = "unix:///var/run/docker.sock"  # host = "tcp://10.4.2.9:2375/"  # host = "unix:///var/run/docker.sock"
#}
# Pull images
#resource "docker_image" "rancher" {
#  name = "rancher/rancher:${var.rancher_version}"
#}

