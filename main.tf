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
  description   = var.compartment.desc
  name          = var.compartment.name
  enable_delete = var.compartment.delete
}

############################################
# COMPARTMENT
############################################

variable "compartment" {
  description = "Configuração do compartment OCI"
  default   = {
    name   = "compartment_tf"
    desc   = "Compartment creation"
    delete = true
  }
}