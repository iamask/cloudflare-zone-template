resource "cloudflare_ruleset" "zone_custom_firewall" {
  zone_id     = var.ZONE_ID
  name        = "Phase entry point ruleset for custom rules in zone tf.zxc.co.in"
  description = ""
  kind        = "zone"
  phase       = "http_request_firewall_custom"

  rules {
    action      = "block"
    expression  = "(ip.geoip.country in {\"CN\" \"PK\" \"RU\" \"IN\"})"
    description = "Geo Block for POC3"
    enabled     = true
  }

  rules {
    action      = "block"
    expression  = "(not cf.edge.server_port in {80 443})"
    description = "Block ports other than 80 and 443"
    enabled     = true
  }

  rules {
    action      = "block"
    expression  = "(ip.geoip.country in {\"CN\" \"PK\" \"RU\" \"IN\"})"
    description = "Geo Block for POC"
    enabled     = true
  }

  rules {
    action      = "log"
    expression  = "(ip.src in $cf.anonymizer) or (ip.src in $cf.botnetcc) or (ip.src in $cf.malware) or (ip.src in $cf.open_proxies) or (ip.src in $cf.vpn)"
    description = "Log Managed IP list"
    enabled     = true
  }

  rules {
    action      = "block"
    expression  = "(cf.threat_score gt 80)"
    description = "Log IP Threatscore"
    enabled     = true
  }

  rules {
    action      = "block"
    expression  = "(cf.waf.score lt 20)"
    description = "WAF Attack score : Attack"
    enabled     = true
  }

  rules {
    action      = "managed_challenge"
    expression  = "(cf.waf.score gt 20 and cf.waf.score lt 50)"
    description = "WAF Attack score : Likely Attack"
    enabled     = true
  }

  rules {
    action      = "block"
    expression  = "(cf.bot_management.score eq 1)"
    description = "Bot Check : Automated"
    enabled     = true
  }

  rules {
    action      = "managed_challenge"
    expression  = "(cf.bot_management.score gt 1 and cf.bot_management.score lt 30)"
    description = "Bot Check : Likely Automated"
    enabled     = true
  }
}