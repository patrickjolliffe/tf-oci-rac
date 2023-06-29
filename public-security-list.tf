resource "oci_core_security_list" "public-security-list" {
  compartment_id = oci_identity_compartment.rac-compartment.id
  vcn_id         = module.vcn.vcn_id
  display_name   = "security-list-for-public-subnet"

  ingress_security_rules {
    stateless   = false
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = "1" # ICMP
    icmp_options {
      type = 3
      code = 4
    }
  }

  ingress_security_rules {
    stateless   = false
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = "6" # TCP
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    stateless   = false
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    protocol    = "6" # TCP
    tcp_options {
      min = 443
      max = 443
    }
  }

  ingress_security_rules {
    stateless   = false
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    protocol    = "1" # ICMP
    icmp_options {
      type = 3
    }
  }

  egress_security_rules {
    stateless   = false
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "6" # TCP
    tcp_options {
      min = 22
      max = 22
    }
  }

  egress_security_rules {
    stateless   = false
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "6" # TCP
    tcp_options {
      min = 443
      max = 443
    }
  }
}