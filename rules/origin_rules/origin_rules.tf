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
        host = "eu-noisy.tf.zxc.co.in"
        port = 8443
      }
    }

    # Check if the hostname's metadata 'customer' is set to 'noisy'
    expression  = "cf.hostname.metadata.customer eq \"noisy\""
    description = "Change origin to some.host for noisy customers"
    enabled     = true
  }
}
