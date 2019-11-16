module "external_dns" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.4.0"
  attributes = "${var.attributes}"
  delimiter  = "${var.delimiter}"
  name       = "external-dns"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  tags       = "${var.tags}"
}

data "aws_route53_zone" "default" {
  count        = "${length(var.dns_zone_names)}"
  name         = "${element(var.dns_zone_names, count.index)}."
  private_zone = false
}

# https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html
data "aws_iam_policy_document" "external_dns" {
  statement {
    sid = "GrantModifyAccessToDomains"
    actions = [
      "route53:ChangeResourceRecordSets",
    ]
    effect    = "Allow"
    resources = formatlist("arn:aws:route53:::hostedzone/%s", data.aws_route53_zone.default.*.zone_id)
  }

  statement {
    sid = "GrantListAccessToDomains"
    # route53:ListHostedZonesByName is not needed by external-dns, but is needed by cert-manager
    actions = [
      "route53:ListHostedZones",
      "route53:ListHostedZonesByName",
      "route53:ListResourceRecordSets",
    ]

    effect    = "Allow"
    resources = ["*"]
  }
}

resource "aws_iam_policy" "default" {
  name   = module.external_dns.id
  policy = data.aws_iam_policy_document.external_dns.json
}