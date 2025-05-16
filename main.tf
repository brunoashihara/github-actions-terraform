############################################
# terraform
############################################
terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "5.23.0"
    }
  }

}

############################################
# PROVIDER
############################################

provider "oci" {
  config_file_profile = "DEFAULT"
}

############################################
# COMPARTMENT
############################################

resource "oci_identity_compartment" "compartment" {
  description   = "Compartment creation"
  name          = "compartment_tf"
  enable_delete = true
}

############################################
# BUCKET
############################################

resource "oci_objectstorage_bucket" "bucket" {
  compartment_id = oci_identity_compartment.compartment.compartment_id
  name           = "test-github-actions-test"
  namespace      = "idnriwtvurim"
  access_type    = "NoPublicAccess"
  storage_tier   = "Standard"
}