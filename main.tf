# Basic example of using the Vault AWS authentication module

terraform {
  cloud {
    organization = "lab-larry"
    workspaces {
      name = "tfc-demo"
    }
  }
}

# module "vault_aws_auth" {
#   source = "git@github.com:songlining/terraform-aws-vault-agent-auth-role.git"
#   # Using default values for simplicity
# }

module "vault-agent-auth-role" {
  source  = "app.terraform.io/lab-larry/vault-agent-auth-role/aws"
  version = "1.0.7"
}

output "vault_server_private_ip" {
  value = module.vault-agent-auth-role.vault_server_private_ip
  description = "Private IP address of the Vault server"
}

output "vault_agent_public_ip" {
  value = module.vault-agent-auth-role.vault_agent_public_ip
  description = "Public IP address of the Vault agent"
}