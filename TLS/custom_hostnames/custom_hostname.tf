resource "cloudflare_custom_hostname" "example" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.netflix.com"
  ssl {
    method = "HTTP"
  }
}