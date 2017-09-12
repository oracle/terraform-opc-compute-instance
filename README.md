OPC Compute Instance
====================

This Terraform module creates a single Oracle Cloud Infrastructure OPC Compute Cloud instance with a persistent block storage boot volume and a single network interface on either the Shared Network or an IP Network interface, with an optional Public IP address reservation.

Usage
-----

### Persistent instance on IP Network

If an IP Network is provided the instance is created with interface on the ip network. Note that the Public IP Address reservation, if provided, must be an [`opc_compute_ip_address_reservation`](https://www.terraform.io/docs/providers/opc/r/opc_compute_ip_address_reservation.html)

```tf
module "opc_instance_on_ip_network" {
  source                 = "https://gtihub.com/oracle/terraform-opc-compute-instance"
  instance_name    = "instance-on-ip-network"
  instance_shape   = "oc3"
  ip_network       = "${opc_compute_ip_network.ip-network.name}"
  ip_reservation   = "${opc_compute_ip_address_reservation.ip-reservation.name}"
  search_domains   = ["cloud.oracle.com", "oraclecloud.com"]
}

resource "opc_compute_ip_network" "ip-network" {
  name = "test-ip-network"
  ip_address_prefix = "192.168.1.0/24"
}

resource "opc_compute_ip_address_reservation" "ip-reservation" {
  name = "test-ip-reservertion"
  ip_address_pool = "public-ippool"
}
```

### Persistent instance on Shared Network

If no IP Network is provided the instance is created with the interface on the Shared Network. Note that the Public IP Address reservation, if provided, must be an [`opc_compute_ip_reservation`](https://www.terraform.io/docs/providers/opc/r/opc_compute_ip_reservation.html)

```tf
module "opc_instance_on_shared_network" {
  source           = "https://gtihub.com/oracle/terraform-opc-compute-instance"
  instance_name    = "instance-on-shared-network"
  instance_shape   = "oc3"
  ip_reservation   = "${opc_compute_ip_reservation.ip-reservation.name}"
  search_domains   = ["cloud.oracle.com", "oraclecloud.com"]
}

resource "opc_compute_ip_reservation" "ip-reservation" {
  parent_pool = "/oracle/public/ippool"
  permanent   = true
}
```

License
-------

Licensed under the [Universal Permissive License v 1.0](LICENSE.md)

Copyright © 2017 Oracle and/or its affiliates. All rights reserved.
