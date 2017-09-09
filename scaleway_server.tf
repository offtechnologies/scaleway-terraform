resource "scaleway_ip" "rancher_server_ip" {
  count = 1
}

resource "scaleway_server" "rancher_server" {
  count          = 1
  name           = "${terraform.workspace}-${count.index + 1}.${var.domain_name}"
  image          = "${data.scaleway_image.xenial.id}"
  type           = "${var.rancher_instance_type}"
  bootscript     = "${data.scaleway_bootscript.mainline.id}"
  security_group = "${scaleway_security_group.rancher.id}"
  public_ip      = "${element(scaleway_ip.rancher_server_ip.*.ip, count.index)}"

  connection {
    type        = "ssh"
    user        = "root"
    agent       = true
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  provisioner "file" {
    source      = "scripts/install-docker-ce.sh"
    destination = "/tmp/install-docker-ce.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install-docker-ce.sh",
      "/tmp/install-docker-ce.sh ${var.docker_version}",
    ]
  }
}
