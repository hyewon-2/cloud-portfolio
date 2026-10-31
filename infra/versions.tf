terraform {
  required_version = ">= 1.10"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # 버킷은 bootstrap/ 레이어가 만든다. 같은 버킷에 key만 다르게 저장한다.
  backend "s3" {
    bucket       = "cloud-portfolio-tfstate-458255180711"
    key          = "infra/terraform.tfstate"
    region       = "ap-northeast-2"
    profile      = "personal"
    encrypt      = true
    use_lockfile = true
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
      Layer     = "infra"
    }
  }
}
