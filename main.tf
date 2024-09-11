terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"

    }

  }
}

# remove this block to store the state file locally
terraform {
  cloud {
    organization = "iamask"
    workspaces {
      name = "cloudflare"
    }
  }
}

provider "cloudflare" {
  api_token = var.API_TOKEN
}

resource "cloudflare_zone_settings_override" "tf-zxc-co-in-settings" {
  zone_id = var.ZONE_ID

  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
    brotli                   = "on"
    http2                    = "on"
    h2_prioritization        = "on"
    http3                    = "on"
    always_use_https         = "on"
    ipv6                     = "on"
    min_tls_version          = "1.3"
    prefetch_preload         = "on"
    zero_rtt                 = "on"
    polish                   = "lossless"
    minify {
      css  = "on"
      html = "on"
      js   = "on"
    }

  }
}

resource "cloudflare_hostname_tls_setting_ciphers" "zoneciphers" {
  zone_id  = var.ZONE_ID
  hostname = "ajay2.tf.zxc.co.in"
  value    = ["ECDHE-ECDSA-AES128-GCM-SHA256", "ECDHE-ECDSA-CHACHA20-POLY1305", "ECDHE-RSA-AES128-GCM-SHA256", "ECDHE-RSA-CHACHA20-POLY1305", "ECDHE-ECDSA-AES256-GCM-SHA384", "ECDHE-RSA-AES256-GCM-SHA384"]
}

module "dns" {
  source    = "./dns"
  API_TOKEN = var.API_TOKEN
  ZONE_ID   = var.ZONE_ID
}

resource "cloudflare_argo" "tf-zxc-co-in-settings" {
  zone_id       = var.ZONE_ID
  smart_routing = "on"
}

module "managed_rules" {
  source    = "./security/managed_rules"
  API_TOKEN = var.API_TOKEN
  ZONE_ID   = var.ZONE_ID
}

module "rate_limit_rules" {
  source    = "./security/rate_limit"
  API_TOKEN = var.API_TOKEN
  ZONE_ID   = var.ZONE_ID
}

module "custom_rules" {
  source    = "./security/custom_rules"
  API_TOKEN = var.API_TOKEN
  ZONE_ID   = var.ZONE_ID
}

module "cache_rules" {
  source    = "./rules/cache_rules"
  API_TOKEN = var.API_TOKEN
  ZONE_ID   = var.ZONE_ID
}


module "transform_rules" {
  source    = "./rules/transform_rules"
  API_TOKEN = var.API_TOKEN
  ZONE_ID   = var.ZONE_ID
}

module "redirect_rules" {
  source    = "./rules/redirect_rules"
  API_TOKEN = var.API_TOKEN
  ZONE_ID   = var.ZONE_ID
}


module "zero_trust_access" {
  source    = "./zero_trust/access"
  API_TOKEN = var.API_TOKEN
  ZONE_ID   = var.ZONE_ID
}


module "custom_hostname" {
  source    = "./tls/custom_hostnames"
  API_TOKEN = var.API_TOKEN
  ZONE_ID   = var.ZONE_ID
}
