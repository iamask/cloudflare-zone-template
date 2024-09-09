resource "cloudflare_custom_hostname" "merchant1" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.netflix.com"
  ssl {
    method = "txt"
  }
   custom_metadata = {
    "customer" = "premium"
    "security_level"   = "low"
    "customer_id" = 123
  }
}


resource "cloudflare_custom_hostname" "merchant2" {
  zone_id  = var.ZONE_ID
  hostname = "spotify.tf.zxc.co.in"
  ssl {
    method = "txt"
  }
   custom_metadata = {
    "customer" = "free"
    "security_level"   = "http"
    "customer_id" = 124
  }
}

