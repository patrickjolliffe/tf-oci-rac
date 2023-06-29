resource "oci_core_subnet" "vcn-public-subnet" {
  compartment_id = oci_identity_compartment.rac-compartment.id
  vcn_id         = module.vcn.vcn_id
  cidr_block     = "10.2.2.0/24"

  display_name = "public-subnet-tf-rac-vcn"
  dns_label = "public"
  
  security_list_ids = [oci_core_security_list.public-security-list.id]
  route_table_id    = module.vcn.ig_route_id
}
