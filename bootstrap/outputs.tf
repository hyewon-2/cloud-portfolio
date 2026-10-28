output "tfstate_bucket" {
  value = aws_s3_bucket.tfstate.bucket
}

output "ecr_repository_url" {
  value = aws_ecr_repository.app.repository_url
}

output "github_actions_role_arn" {
  description = "GitHub 저장소 변수 AWS_ROLE_ARN에 넣을 값"
  value       = aws_iam_role.github_actions.arn
}
