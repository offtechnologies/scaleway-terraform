resource "scaleway_security_group" "my_group" {
  name        = "Rancher"
  description = "Allow SSH traffic"
}

resource "scaleway_security_group_rule" "ssh_accept" {
  security_group = "${scaleway_security_group.my_group.id}"

  action    = "accept"
  direction = "inbound"
  ip_range  = "0.0.0.0/0"
  protocol  = "TCP"
  port      = 22
}

#resource "scaleway_security_group_rule" "http_accept" {
#  security_group = "${scaleway_security_group.my_group.id}"
#
#  action    = "accept"
#  direction = "inbound"
#  ip_range  = "0.0.0.0/0"
#  protocol  = "TCP"
#  port      = 80
#}


#resource "scaleway_security_group_rule" "https_accept" {
#  security_group = "${scaleway_security_group.my_group.id}"
#
#  action    = "accept"
#  direction = "inbound"
#  ip_range  = "0.0.0.0/0"
#  protocol  = "TCP"
#  port      = 443
#}


#resource "scaleway_security_group_rule" "rancher_web_accept" {
#  security_group = "${scaleway_security_group.my_group.id}"
#
#  action    = "accept"
#  direction = "inbound"
#  ip_range  = "0.0.0.0/0"
#  protocol  = "TCP"
#  port      = 8080
#}


#resource "scaleway_security_group_rule" "IPSec_500_accept" {
#  security_group = "${scaleway_security_group.my_group.id}"
#
#  action    = "accept"
#  direction = "inbound"
#  ip_range  = "0.0.0.0/0"
#  protocol  = "UDP"
#  port      = 500
#}


#resource "scaleway_security_group_rule" "IPSec_4500_accept" {
#  security_group = "${scaleway_security_group.my_group.id}"
#
#  action    = "accept"
#  direction = "inbound"
#  ip_range  = "0.0.0.0/0"
#  protocol  = "UDP"
#  port      = 4500
#}


#resource "scaleway_security_group_rule" "docker_egress_1" {
#  security_group = "${scaleway_security_group.my_group.id}"
#
#  action    = "accept"
#  direction = "inbound"
#  ip_range  = "0.0.0.0/0"
#  protocol  = "TCP"
#  port      = 2376
#}


#resource "scaleway_security_group_rule" "docker_egress_2" {
#  security_group = "${scaleway_security_group.my_group.id}"
#
#  action    = "accept"
#  direction = "inbound"
#  ip_range  = "0.0.0.0/0"
#  protocol  = "TCP"
#  port      = 2375
#}

