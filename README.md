OPC Compute Instance on Shared Network
======================================

This Terraform module creates a single Oracle Cloud Infrastructure OPC Compute Cloud instance with persistent block storage and optional public IP address reservation on the Shared Network interface.

Usage
-----

```tf
module "opc_instance" {
  source                 = "https://gtihub.com/oracle/terraform-opc-compute-instance"
  instance_name          = "instance1"
  instance_shape         = "oc3"
  boot_volume_image_list = "/oracle/public/OL_7.2_UEKR4_x86_64"
  ip_reservation         = "${opc_compute_ip_reservation.ip-reservation.name}"
  search_domains         = ["cloud.oracle.com", "oraclecloud.com"]
  ssh_keys               = ["${opc_compute_ssh_key.sshkey.name}"]
  tags                   = ["tag1"]
}

resource "opc_compute_ip_reservation" "ip-reservation" {
  parent_pool = "/oracle/public/ippool"
  permanent   = true
}
```
