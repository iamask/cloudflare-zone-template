resource "cloudflare_access_application" "staging_app" {
  zone_id          = var.ZONE_ID
  name             = "staging application"
  domain           = "staging.tf.zxc.co.in"
  type             = "self_hosted"
  session_duration = "24h"
  cors_headers {
    allowed_methods   = ["GET", "POST", "OPTIONS"]
    allowed_origins   = ["https://zxc.co.in"]
    allow_credentials = true
    max_age           = 20
  }
}