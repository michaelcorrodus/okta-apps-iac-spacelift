terraform {
  required_version = ">= 1.5.0"
  required_providers {
    okta = {
      source  = "hashicorp/okta"
      version = "= 6.3.1"
    }
  }
}
