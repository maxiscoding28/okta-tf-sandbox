variable "okta_token" {
  type = string
}


variable "user_password" {
  type      = string
  sensitive = true
}
variable "user_list" {
  type    = list(string)
  default = ["john_smith", "jane_doe", "alex_rivera", "peter_jones", "susan_miller", "michael_davis", "emily_white", "david_brown", "sarah_wilson"]
}

variable "org_name" {
  type = string
}
