resource "cloudflare_access_application" "staging_app" {
  zone_id          = "bcbaeaa288da7324b61d91b0e41adc90"
  name             = "staging application"
  domain           = "staging.example.com"
  type             = "self_hosted"
  session_duration = "24h"
  cors_headers {
    allowed_methods   = ["GET", "POST", "OPTIONS"]
    allowed_origins   = ["https://example.com"]
    allow_credentials = true
    max_age           = 10
  }
}