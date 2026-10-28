variable "project" {
  type    = string
  default = "cloud-portfolio"
}

variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "github_repo" {
  description = "GitHub Actions가 AWS에 접근할 수 있는 저장소 (owner/name)"
  type        = string
}

variable "budget_email" {
  description = "예산 초과 알림을 받을 이메일"
  type        = string
}

variable "budget_limit_usd" {
  description = "월 예산 한도 (USD)"
  type        = number
  default     = 5
}

variable "aws_profile" {
  description = "사용할 AWS CLI 프로필"
  type        = string
  default     = "personal"
}

variable "aws_account_id" {
  description = "이 계정이 아니면 Terraform이 실행을 거부한다"
  type        = string
  default     = "458255180711"
}
