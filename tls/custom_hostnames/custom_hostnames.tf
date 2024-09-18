resource "cloudflare_custom_hostname" "merchant1" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.netflix.com"
  ssl {
    method = "txt"
  }
   custom_metadata = {
    "customer" = "premium"
    "security_level"   = "low"
    "customer_id" = 1
    "region" = "US"
    "customer_noise" = "high"
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
    "customer" = "premium"
    "security_level"   = "high"
    "customer_id" = 2
    "region" = "IN"
    "customer_noise" = "high"
  
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
    "customer_id" = 3
    "region" = "IN"
    "customer_noise" = "low"
  
  }
}


resource "cloudflare_custom_hostname" "merchant4" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.cloudflare.com"
  ssl {
    method = "txt"
  }
   custom_metadata = {
    "customer" = "premium"
    "security_level"   = "high"
    "customer_id" = 4
    "region" = "US"
    "customer_noise" = "low"
  
  }
}


resource "cloudflare_custom_hostname" "merchant5" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.wednesday.com"
  ssl {
    method = "txt"
  }
   custom_metadata = {
    "customer" = "premium"
    "security_level"   = "low"
    "customer_id" = 5
    "region" = "EU"
    "customer_noise" = "high"
  
  }
}

resource "cloudflare_custom_hostname" "merchant6" {
  zone_id  = var.ZONE_ID
  hostname = "checkout.testing.com"
  ssl {
    method = "txt"
  }
   custom_metadata = {
    "customer" = "premium"
    "security_level"   = "high"
    "customer_id" = 6
    "region" = "EU"
    "customer_noise" = "high"
  
  }
}


