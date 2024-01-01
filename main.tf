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

resource "cloudflare_record" "a" {
  zone_id = "bcbaeaa288da7324b61d91b0e41adc90"
  name    = "aa"
  value   = "1.0.23.100"
  type    = "A"
  proxied = true
}
resource "cloudflare_zone_settings_override" "example-com-settings" {
  zone_id = "bcbaeaa288da7324b61d91b0e41adc90"

  settings {
    tls_1_3                  = "on"
    automatic_https_rewrites = "on"
    ssl                      = "strict"
  }
}

# Configure a ruleset at the zone level for the "http_request_firewall_managed" phase
resource "cloudflare_ruleset" "zone_level_managed_waf" {
  zone_id     = "bcbaeaa288da7324b61d91b0e41adc90"
  name        = "Managed WAF entry point ruleset"
  description = "Zone-level WAF Managed Rules config"
  kind        = "zone"
  phase       = "http_request_firewall_managed"

  # Execute Cloudflare Managed Ruleset
  rules {
    action = "execute"
    action_parameters {
      id      = "efb7b8c949ac4650a09736fc376e9aee"
      version = "latest"
    }
    expression  = "true"
    description = "Execute Cloudflare Managed Ruleset on my zone-level phase entry point ruleset"
    enabled     = true
  }

  # Execute Cloudflare OWASP Core Ruleset
  rules {
    action = "execute"
    action_parameters {
      id      = "4814384a9e5d4991b9815dcfc25d2f1f"
      version = "latest"
    }
    expression  = "true"
    description = "Execute Cloudflare OWASP Core Ruleset on my zone-level phase entry point ruleset"
    enabled     = true
  }
}

resource "cloudflare_ruleset" "zone_custom_firewall" {
  zone_id     = "bcbaeaa288da7324b61d91b0e41adc90"
  name        = "Phase entry point ruleset for custom rules in my zone"
  description = ""
  kind        = "zone"
  phase       = "http_request_firewall_custom"

  rules {
    action      = "block"
    expression  = "(not cf.edge.server_port in {80 443})"
    description = "Block ports other than 80 and 443"
    enabled     = true
  }
}

resource "cloudflare_ruleset" "zone_custom_firewal2l" {
  zone_id     = "bcbaeaa288da7324b61d91b0e41adc90"
  name        = "Phase entry point ruleset for custom rules in my zone"
  description = ""
  kind        = "zone"
  phase       = "http_request_firewall_custom"

  rules {
    action      = "block"
    expression  = "(not cf.edge.server_port in {80 446})"
    description = "Block ports other than 80 and 446"
    enabled     = true
  }
}