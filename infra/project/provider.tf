terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket         = "std16-test-bucket"                                      # 테라폼 상태파일을 저장할 버킷 이름
    key            = "terraformState/Ex/ex7-terraform-cicd/terraform.tfstate" # 버킷에서 테라폼 상태파일 저장 경로
    region         = "us-east-2"
    dynamodb_table = "std16-lab-lock-table" # 락온 상태를 저장할 DynamoDB table 이름
    encrypt        = true                   # 파일 암호화
  }
}

provider "aws" {
  region = "us-east-2"
}

