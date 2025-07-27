terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }

  backend "s3" {
    bucket       = "docker-remote-state"
    key          = "docker-vm"
    region       = "us-east-1"
    use_lockfile = true

  }
}

provider "aws" {

}

