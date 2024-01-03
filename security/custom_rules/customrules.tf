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

  rules {
    action      = "block"
    expression  = "(not cf.edge.server_port in {800 443})"
    description = "Block ports other than 800 and 443"
    enabled     = true
  }
}

