module "gitlab_group_membership" {
  source = "../../"

  group_id     = data.gitlab_group.this.group_id
  user_id      = data.gitlab_user.this.user_id
  access_level = "owner"
}
