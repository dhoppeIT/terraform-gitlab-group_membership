variable "access_level" {
  type        = string
  description = "Access level for the member"

  validation {
    condition     = contains(["no one", "minimal", "guest", "reporter", "developer", "maintainer", "owner"], var.access_level)
    error_message = "Valid values are no one, minimal, guest, reporter, developer, maintainer, owner"
  }
}

variable "group_id" {
  type        = string
  description = "The id of the group"
}

variable "user_id" {
  type        = number
  description = "The id of the user"
}

variable "expires_at" {
  type        = string
  default     = null
  description = "Expiration date for the group membership"
}

variable "member_role_id" {
  type        = number
  default     = null
  description = "The ID of a custom member role"
}

variable "skip_subresources_on_destroy" {
  type        = bool
  default     = false
  description = "Whether the deletion of direct memberships of the removed member in subgroups and projects should be skipped"
}

variable "unassign_issuables_on_destroy" {
  type        = bool
  default     = false
  description = "Whether the removed member should be unassigned from any issues or merge requests inside a given group or project"
}
