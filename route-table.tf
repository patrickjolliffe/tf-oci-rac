resource "oci_core_route_table" "route-table" {
  compartment_id = oci_identity_compartment.rac-compartment.id
  vcn_id         = module.vcn.vcn_id
  display_name   = "rac-route-table"
}
