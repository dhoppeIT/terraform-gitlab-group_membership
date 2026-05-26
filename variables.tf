variable "access_level" {
  type        = string
  description = "Access level for the member. Valid values are: no one, minimal, guest, planner, reporter, developer, maintainer, owner"

  validation {
    condition     = contains(["no one", "minimal", "guest", "planner", "reporter", "developer", "maintainer", "owner"], var.access_level)
    error_message = "Valid values are no one, minimal, guest, planner, reporter, developer, maintainer, owner"
  }
}

variable "group_id" {
  type        = number
  description = "The ID of the group"
}

variable "user_id" {
  type        = number
  description = "The ID of the user"
}

variable "expires_at" {
  type        = string
  default     = null
  description = "Expiration date for the group membership. Format: YYYY-MM-DD"
}

variable "member_role_id" {
  type        = number
  default     = null
  description = "The ID of a custom member role. Only available for Ultimate instances"
}

variable "skip_subresources_on_destroy" {
  type        = bool
  default     = false
  description = "Whether the deletion of direct memberships of the removed member in subgroups and projects should be skipped. Only used during a destroy"
}

variable "unassign_issuables_on_destroy" {
  type        = bool
  default     = false
  description = "Whether the removed member should be unassigned from any issues or merge requests inside a given group or project. Only used during a destroy"
}
