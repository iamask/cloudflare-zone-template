resource "cloudflare_custom_hostname_fallback_origin" "example" {
  zone_id = var.ZONE_ID
  origin  = "fallback.tf.zxc.co.in"
}