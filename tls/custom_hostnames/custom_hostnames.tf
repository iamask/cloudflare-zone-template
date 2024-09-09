resource "cloudflare_custom_hostname" "custom_hostnames" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.netflix.com"
  ssl {
    method = "HTTP"
  }
}
