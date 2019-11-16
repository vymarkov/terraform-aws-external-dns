output "policy_name" {
  value       = "${aws_iam_policy.default.name}"
  description = "IAM policy name"
}

output "policy_id" {
  value       = "${aws_iam_policy.default.id}"
  description = "IAM policy ID"
}

output "policy_arn" {
  value       = "${aws_iam_policy.default.arn}"
  description = "IAM policy ARN"
}
