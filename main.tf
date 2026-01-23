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

resource "okta_user" "users" {
  for_each = local.processed_users

  first_name = each.value.fname
  last_name  = each.value.lname
  login      = each.value.email
  email      = each.value.email
  password   = var.user_password
}

resource "okta_group" "functional_groups" {
  for_each = toset(local.group_names)

  name        = title(each.value)
  description = "Group for ${each.value} users"
}

resource "okta_group_memberships" "even_split" {
  for_each = local.group_assignments
  group_id = okta_group.functional_groups[each.key].id
  users    = each.value
}



# https://docs.github.com/en/enterprise-cloud@latest/admin/managing-iam/provisioning-user-accounts-with-scim/configuring-scim-provisioning-with-okta

# Groups in Okta


# https://registry.terraform.io/providers/integrations/github/latest/docs/resources/team_sync_group_mapping