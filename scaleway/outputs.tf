output "public_ip" {
  value = "${scaleway_ip.my_server_ip.0.public_ip}"
}

output "private_ip" {
  value = "${scaleway_ip.my_server_ip.0.private_ip}"
}
