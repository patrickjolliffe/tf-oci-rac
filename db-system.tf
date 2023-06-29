resource "oci_database_db_system" "ora19-ad1" {
  availability_domain = var.availability_domain
  compartment_id      = oci_identity_compartment.rac-compartment.id
  db_home {
    database {
      admin_password = var.db_admin_password
      db_name        = "ora19rac"
      db_workload    = "OLTP"
      pdb_name       = "pdb1"            
    }
    db_version = "19.19.0.0"
  }
  defined_tags = {
    "Schedule.AnyDay" = "0,*,*,*,*,*,0,*,*,*,*,*,0,*,*,*,*,*,0,*,*,*,*,*"
  }
  hostname                        = "ORA19RAC"
  domain                          = "public.vcnrac.oraclevcn.com"
  shape                           = "VM.Standard2.2"
  ssh_public_keys                 = var.db_public_keys
  subnet_id                       = oci_core_subnet.vcn-public-subnet.id
  display_name                    = "ora19-rac"
  data_storage_size_in_gb         = 256
  database_edition                = "ENTERPRISE_EDITION_EXTREME_PERFORMANCE"
  db_system_options {
      storage_management = "ASM"
  }
  license_model                   = "BRING_YOUR_OWN_LICENSE"
  node_count                      = 2
  storage_volume_performance_mode = "BALANCED"
  cpu_core_count                  = 2
}