resource "oci_core_public_ip" "public_ip1" {
    compartment_id      = oci_identity_compartment.rac-compartment.id
    lifetime = "RESERVED"
}