data "gitlab_group" "this" {
  full_path = "example-group-48165"
}

data "gitlab_user" "this" {
  username = "dhoppe"
}
