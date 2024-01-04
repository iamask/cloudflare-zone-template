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


resource "cloudflare_zone_settings_override" "tf-zxc-co-in-settings" {
  zone_id = "bcbaeaa288da7324b61d91b0e41adc90"

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

resource "cloudflare_argo" "tf-zxc-co-in-settings" {
  zone_id        = "bcbaeaa288da7324b61d91b0e41adc90"
  smart_routing  = "on"
}

module "managed_rules" {
  source = "./security/managed_rules"
}

module "rate_limit_rules" {
  source = "./security/rate_limit"
}

module "custom_rules" {
  source = "./security/custom_rules"
}

module "cache_rules" {
  source = "./cache_rules"
}


module "transform_rules" {
  source = "./transform_rules"
}


module "zero_trust_access" {
  source = "./zero_trust/access"
}

