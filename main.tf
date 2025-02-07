resource "gitlab_group_membership" "this" {
  group_id     = var.group_id
  user_id      = var.user_id
  access_level = var.access_level

  expires_at                    = var.expires_at
  member_role_id                = var.member_role_id
  skip_subresources_on_destroy  = var.skip_subresources_on_destroy
  unassign_issuables_on_destroy = var.unassign_issuables_on_destroy
}
