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
