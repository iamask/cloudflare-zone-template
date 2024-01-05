resource "cloudflare_ruleset" "transform_modify_request_headers" {
  zone_id     = var.ZONE_ID
  name        = "Transform Rule performing HTTP request header modifications"
  description = ""
  kind        = "zone"
  phase       = "http_request_late_transform"

  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "X-Source"
        operation = "set"
        value     = "Cloudflare"
      }
    
    }
    expression = "true"
    description = "Example HTTP Request Header Modification Rule"
    enabled = true
  }
}