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


resource "cloudflare_record" "wildcard" {
  zone_id = var.ZONE_ID
  name    = "*"
  value   = "34.93.22.64"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "delhi" {
  zone_id = var.ZONE_ID
  name    = "delhi"
  value   = "34.131.175.140"
  type    = "A"
  proxied = true
}


resource "cloudflare_record" "api" {
  zone_id = var.ZONE_ID
  name    = "api"
  value   = "34.131.175.40"
  type    = "A"
  proxied = true
}


resource "cloudflare_record" "api2" {
  zone_id = var.ZONE_ID
  name    = "api2"
  value   = "34.131.175.40"
  type    = "A"
  proxied = true
}



