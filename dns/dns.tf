resource "cloudflare_record" "www" {
  zone_id = var.ZONE_ID
  name    = "www"
  value   = "203.0.113.177"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "a" {
  zone_id = var.ZONE_ID
  name    = "aa"
  value   = "122.0.23.145"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "aa" {
  zone_id = var.ZONE_ID
  name    = "aa"
  value   = "200.0.23.100"
  type    = "A"
  proxied = true
}
