terraform {
  required_version = ">= 1.10"

  # 버킷은 이 레이어가 만든다. 처음에는 로컬 state로 apply 한 뒤 -migrate-state로 옮겼다.
  backend "s3" {
    bucket       = "cloud-portfolio-tfstate-458255180711"
    key          = "bootstrap/terraform.tfstate"
    region       = "ap-northeast-2"
    profile      = "personal"
    encrypt      = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile

  # 다른 계정(예: 팀 프로젝트 계정)에 실수로 만드는 것을 막는다.
  allowed_account_ids = [var.aws_account_id]

  default_tags {
    tags = {
      Project   = var.project
      ManagedBy = "terraform"
      Layer     = "bootstrap"
    }
  }
}
