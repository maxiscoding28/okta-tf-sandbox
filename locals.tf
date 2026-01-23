locals {
  processed_users = {
    for name in var.user_list : name => {
      # split("john_smith") -> ["john", "smith"]
      # title() capitalizes the first letter
      fname = title(split("_", name)[0])
      lname = title(split("_", name)[1])

      email = "${split("_", name)[0]}.${split("_", name)[1]}@example.com"
    }
  }

  group_names = ["admins", "developers", "support"]

  all_user_ids = sort([for u in okta_user.users : u.id])
  user_chunks  = chunklist(local.all_user_ids, 3)

  group_assignments = {
    "admins"     = local.user_chunks[0]
    "developers" = local.user_chunks[1]
    "support"    = local.user_chunks[2]
  }
}