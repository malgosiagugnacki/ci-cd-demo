packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}



source "amazon-ebs" "image" {
  ami_name             = "golden-image {{timestamp}}"
  ssh_keypair_name     = "packer"
  instance_type        = "t2.micro"
  ssh_username         = "ec2-user"
  region               = "us-east-2"
  source_ami           = "ami-0e820afa569e84cc1"
  run_tags = {
    Name = "Packer instance for golden-image"
  }
}

build {
  sources = [
    "source.amazon-ebs.image"
  ]
}









