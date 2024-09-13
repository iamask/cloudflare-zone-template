# Change origin for an API route
resource "cloudflare_ruleset" "http_origin_noisy" {
  zone_id     = var.ZONE_ID
  name        = "Origin rule"
  description = "Origin Rulests"
  kind        = "zone"
  phase       = "http_request_origin"

  rules {
    action = "route"
    action_parameters {
      origin {
        host = "delhi.tf.zxc.co.in"
      }
    }

    # Check if the hostname's metadata 'customer_noise' is set to 'high'
    expression  = "lookup_json_string(cf.hostname.metadata, \"customer_noise\") == \"high\""
    description = "Change origins for noisy customers"
    enabled     = true
  }
}
