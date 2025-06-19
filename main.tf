# Basic example of using the Vault AWS authentication module

terraform {
  cloud {
    organization = "lab-larry"
    workspaces {
      name = "tfc-demo"
    }
  }
}

# module "vault-agent-auth-role" {
#   source = "github.com/songlining/terraform-aws-vault-agent-auth-role.git"
    
#   aws_region  = "ap-southeast-2"
#   # aws_region  = "ap-southeast-1"
#   instance_type = "t4g.small"
#   # instance_type = "t4g.micro"
#   # instance_type = "t4g.medium"
# }

module "vault-agent-auth-role" {
  source  = "app.terraform.io/lab-larry/vault-agent-auth-role/aws"
  version = "1.0.9"

  aws_region  = "ap-southeast-2"
  # aws_region  = "ap-southeast-1"
  instance_type = "t4g.small"
  # instance_type = "t4g.micro"
  # instance_type = "t4g.medium"
}

output "vault_server_private_ip" {
  value = module.vault-agent-auth-role.vault_server_private_ip
  description = "Private IP address of the Vault server"
}

output "vault_agent_public_ip" {
  value = module.vault-agent-auth-role.vault_agent_public_ip
  description = "Public IP address of the Vault agent"
}