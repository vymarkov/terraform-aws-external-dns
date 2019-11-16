## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| dns_zone_names | Names of zones to manage (e.g. `us-east-1.cloudposse.co` or `cluster-1.cloudposse.co`) | list | - | yes |
| name | Name (e.g. `external-dns`) | string | `external-dns` | no |
| namespace | Namespace (e.g. `cp` or `cloudposse`) | string | - | yes |
| stage | Stage (e.g. `prod`, `dev`, `staging`) | string | - | yes |
| tags | Additional tags (e.g. map(`Cluster`,`us-east-1.cloudposse.co`) | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| policy_arn | IAM policy ARN |
| policy_id | IAM policy ID |
| policy_name | IAM policy name |
