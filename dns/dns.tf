resource "cloudflare_record" "www" {
  zone_id = var.ZONE_ID
  name    = "www"
  content   = "34.93.22.64"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "fallback" {
  zone_id = var.ZONE_ID
  name    = "www"
  content   = "34.93.22.64"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "wildcard" {
  zone_id = var.ZONE_ID
  name    = "*"
  content   = "www.tf.zxc.co.in"
  type    = "CNAME"
  proxied = true
}
