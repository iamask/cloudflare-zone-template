resource "cloudflare_custom_hostnames" "custom_hostnames" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.netflix.co.in"
  ssl {
    method = "HTTP"
  }
}