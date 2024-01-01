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

resource "cloudflare_record" "www" {
  zone_id = "bcbaeaa288da7324b61d91b0e41adc90"
  name    = "www"
  value   = "203.0.113.100"
  type    = "A"
  proxied = true
}
