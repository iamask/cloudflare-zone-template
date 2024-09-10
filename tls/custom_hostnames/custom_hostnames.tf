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
  hostname = "ajay.tf.zxc.co.in"
  custom_origin_server = "www.tf.zxc.co.in"
  ssl {
    method = "http"
  }
   custom_metadata = {
    "customer" = "free"
    "security_level"   = "high"
    "customer_id" = 124
  
  }
}


resource "cloudflare_custom_hostname" "merchant3" {
  zone_id  = var.ZONE_ID
  hostname = "ajay2.tf.zxc.co.in"
  ssl {
    method = "http"
  }
   custom_metadata = {
    "customer" = "free"
    "security_level"   = "high"
    "customer_id" = 124
  
  }
}


resource "cloudflare_custom_hostname" "merchant4" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.cloudflare3.com"
  ssl {
    method = "txt"
  }
   custom_metadata = {
    "customer" = "premium"
    "security_level"   = "high"
    "customer_id" = 124
  
  }
}

