# Configure a ruleset at the zone level for the "http_request_firewall_managed" phase
resource "cloudflare_ruleset" "zone_level_managed_waf" {
  zone_id     = var.ZONE_ID
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
    description = "ExecutE Cloudflare Managed Ruleset on my zone-level phase entry point ruleset"
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