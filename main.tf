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


module "managed_rules" {
  source = "./security"
}

module "custom_rules" {
  source = "./security"
}

module "rate_limit" {
  source = "./security"
}

module "cache_rules" {
  source = "./cache_rules"
}

module "transform_rules" {
  source = "./transform_rules"
}

module "zerotrust_access" {
  source = "./zero_trust/access"
}

resource "cloudflare_zone_settings_override" "example-com-settings" {
  zone_id = "bcbaeaa288da7324b61d91b0e41adc90"

  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}
