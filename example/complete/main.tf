provider "aws" {
  region = "us-east-2"
}

module "external_dns_iam_policy" {
  source         = "./../.."
  name           = "external-dns"
  namespace      = "cp"
  stage          = "prod"
  dns_zone_names = ["us-east-1.cloudposse.co", "cloudposse.co"]

  tags = {
    Cluster = "us-east-1.cloudposse.co"
  }
}