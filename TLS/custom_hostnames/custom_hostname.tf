resource "cloudflare_custom_hostname" "custom_hostname" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.netflix.co.in"
  ssl {
    method = "HTTP"
  }
}