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

# GitHub OIDC 토큰의 sub에는 이름 뒤에 바뀌지 않는 ID가 붙는다.
# 예: repo:hyewon-2@83633385/cloud-portfolio@1436823155:ref:refs/heads/main
# 이름만 쓰면 저장소를 지우고 남이 같은 이름으로 만들었을 때도 통과할 수 있어서, ID까지 맞춰 본다.
variable "github_owner_id" {
  description = "GitHub 계정의 숫자 ID"
  type        = string
  default     = "83633385"
}

variable "github_repo_id" {
  description = "GitHub 저장소의 숫자 ID"
  type        = string
  default     = "1436823155"
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
