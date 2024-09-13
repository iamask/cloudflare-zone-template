resource "cloudflare_record" "wwe" {
  zone_id = var.ZONE_ID
  name    = "wwe"
  value   = "34.93.22.64"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "fallback" {
  zone_id = var.ZONE_ID
  name    = "fallback"
  value   = "34.93.22.64"
  type    = "A"
  proxied = true
}


resource "cloudflare_record" "test" {
  zone_id = var.ZONE_ID
  name    = "test"
  value   = "www.tf.zxc.co.in"
  type    = "CNAME"
  proxied = true
}

resource "cloudflare_record" "delhi" {
  zone_id = var.ZONE_ID
  name    = "delhi"
  value   = "34.93.22.64"
  type    = "A"
  proxied = true
}

