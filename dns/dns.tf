resource "cloudflare_record" "www" {
  zone_id = "bcbaeaa288da7324b61d91b0e41adc90"
  name    = "www"
  value   = "203.0.113.100"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "a" {
  zone_id = "bcbaeaa288da7324b61d91b0e41adc90"
  name    = "aa"
  value   = "1.0.23.100"
  type    = "A"
  proxied = true
}

resource "cloudflare_record" "aa" {
  zone_id = "bcbaeaa288da7324b61d91b0e41adc90"
  name    = "aa"
  value   = "200.0.23.190"
  type    = "A"
  proxied = true
}