terraform {
  required_version = "~> 1.0" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
  # Provider Block
provider "aws" {
    region  = "us-west-1"
    #profile = "Kenmak"
  }

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "my-tfinfra-buc"
    key    = "terraform/terraform.tfstate"
    region = "us-west-1"
  }
}

/*data "terraform_remote_state" "network" {
  backend = "local"
  config = {
      path    = "../remote-data-source/terraform.tfstate"
  }
}*/
