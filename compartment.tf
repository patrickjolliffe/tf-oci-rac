resource "oci_identity_compartment" "rac-compartment" {
    # Required
    compartment_id = var.terraform_compartment
    description = "Compartment for RAC Testing"
    name = "RAC"
}
