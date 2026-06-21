# HashiCorp Vault policy to allow Nomad to read the Omni-AI keys 
# without exposing them in plaintext configuration files.

path "secret/data/nomad-x/production/*" {
  capabilities = ["read", "list"]
}

path "secret/data/nomad-x/corporate/*" {
  capabilities = ["read"]
}

# Deny access to the core banking/treasury secrets
path "secret/data/treasury/*" {
  capabilities = ["deny"]
}
