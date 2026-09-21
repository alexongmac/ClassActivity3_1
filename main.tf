terraform {
  backend "s3" {
    bucket = "sctp-tfstate-ce13"
    key    = "alex-31-terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "alex_s3_buc" {
  bucket_prefix = "alex-31-bkt"

  tags = {
    Name        = "alex-31"
    Environment = "Dev-31"
  }
}

module "github_oidc_bootstrap" {
  source = "./github-oidc-bootstrap"

  github_repository_username = "alexongmac"
  github_repository_name     = "ClassActivity3_1"
  github_oidc_role_name      = "alex-31-github-oidc-role"
}

output "github_oidc_role_arn" {
  value = module.github_oidc_bootstrap.github_oidc_role_arn
}