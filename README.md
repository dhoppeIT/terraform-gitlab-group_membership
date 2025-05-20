# terraform-gitlab-group_membership

Terraform module to manage the following Twingate resources:

* gitlab_group_membership

## Usage

Copy and paste the following code snippet to your Terraform configuration,
specify the required variables and run the command `terraform init`.

```hcl
module "gitlab_group" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-group/local"
  version = "1.1.4"

  name = "Example (group)"
  path = "example-group-48165"
}

module "gitlab_user" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-user/local"
  version = "1.2.0"

  name     = "John Doe"
  username = "jdoe"
  password = "XKvhCJp9MtwTgwRu" # gitleaks:allow
  email    = "john.doe@example.com"
}

module "gitlab_group_membership" {
  source  = "gitlab.com/terraform-child-modules-48151/terraform-gitlab-group-membership/local"
  version = "1.0.0"

  group_id     = module.gitlab_group.id
  user_id      = module.gitlab_user.id
  access_level = "owner"
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | ~> 18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | ~> 18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_group_membership.this](https://registry.terraform.io/providers/gitlabhq/gitlab/latest/docs/resources/group_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_level"></a> [access\_level](#input\_access\_level) | Access level for the member | `string` | n/a | yes |
| <a name="input_expires_at"></a> [expires\_at](#input\_expires\_at) | Expiration date for the group membership | `string` | `null` | no |
| <a name="input_group_id"></a> [group\_id](#input\_group\_id) | The id of the group | `string` | n/a | yes |
| <a name="input_member_role_id"></a> [member\_role\_id](#input\_member\_role\_id) | The ID of a custom member role | `number` | `null` | no |
| <a name="input_skip_subresources_on_destroy"></a> [skip\_subresources\_on\_destroy](#input\_skip\_subresources\_on\_destroy) | Whether the deletion of direct memberships of the removed member in subgroups and projects should be skipped | `bool` | `false` | no |
| <a name="input_unassign_issuables_on_destroy"></a> [unassign\_issuables\_on\_destroy](#input\_unassign\_issuables\_on\_destroy) | Whether the removed member should be unassigned from any issues or merge requests inside a given group or project | `bool` | `false` | no |
| <a name="input_user_id"></a> [user\_id](#input\_user\_id) | The id of the user | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of this resource |
<!-- END_TF_DOCS -->

## Authors

Created and maintained by [Dennis Hoppe](https://gitlab.com/dhoppeIT).

## License

Apache 2 licensed. See [LICENSE](LICENSE) for full details.
