provider "scaleway" {
  region = "${var.my_region}"
}

data "scaleway_bootscript" "my_bootscript" {
  architecture = "${var.my_architecture}"
  name_filter  = "${var.my_bootscript}"
}

data "scaleway_image" "my_image" {
  architecture = "${var.my_architecture}"
  name         = "${var.my_image}"
}

resource "scaleway_ip" "my_server_ip" {
  count = 1
}

resource "scaleway_server" "my_server" {
  count      = 1
  name       = "${terraform.workspace}-${count.index + 1}.${var.my_domain_name}"
  image      = "${data.scaleway_image.my_image.id}"
  type       = "${var.my_instance_type}"
  bootscript = "${data.scaleway_bootscript.my_bootscript.id}"
  public_ip  = "${element(scaleway_ip.my_server_ip.*.ip, count.index)}"

  # my firewall will be set up later via Ansible ...
  security_group = "${scaleway_security_group.my_group.id}"

  connection {
    type        = "ssh"
    user        = "root"
    agent       = true
    private_key = "${file("~/.ssh/id_rsa")}"
  }

  #provisioner "file" {
  #  source      = "scripts/install-docker-ce.sh"
  #  destination = "/tmp/install-docker-ce.sh"
  #}

  provisioner "local-exec" {
    command = "echo  ${scaleway_ip.my_server_ip.0.ip} ansible_connection=ssh ansible_ssh_user=root >> my_hosts"
  }
}
