terraform {
  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 5.4"
    }
  }
}

provider "okta" {
  org_name  = var.org_name
  base_url  = "okta.com"
  api_token = var.okta_token
}

resource "okta_user" "john_smith" {
  first_name = "John"
  last_name  = "Smith"
  login      = "john.smith@example.com"
  email      = "john.smith@example.com"
  password   = var.user_password
}

