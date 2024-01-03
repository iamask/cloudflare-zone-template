terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"

    }

  }
}

terraform {
  cloud {
    organization = "iamask"
    workspaces {
      name = "cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = var.TF_VAR_CLOUDFLARE_API_TOKEN
}

module "dns" {
  source = "./dns"
}


resource "cloudflare_zone_settings_override" "example-com-settings" {
  zone_id = "bcbaeaa288da7324b61d91b0e41adc90"

  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}

module "managed_rules" {
  source = "./security/managed_rules"
}

module "custom_rules" {
  source = "./security/custom_rules"
}

module "cache_rules" {
  source = "./cache_rules"
}


module "transform_rules" {
  source = "./zero_trust/access"
}

module "zerotrust_access" {
  source = "./zero_trust/access"
}
