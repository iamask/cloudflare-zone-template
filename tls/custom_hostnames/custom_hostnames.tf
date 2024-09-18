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
    "customer_noise" = "low"
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


/* Direct Definition works well for small-scale projects with few resources where each resource may need individual customization.
Using for_each and Maps is better suited for large-scale environments where consistency, scalability, and
maintainability are more critical than having each resource defined separately.

Variable Definition:
The custom_hostnames variable is a map of objects, where each object represents a merchant's configuration.
Each object contains fields like hostname, ssl_method, and custom_metadata, which can vary across merchants.
The optional custom_origin_server is handled by using try() to provide a fallback to null if the field is not set.

Resource Definition:
The for_each iterates over each merchant in the custom_hostnames map.
each.value accesses the individual values (like hostname, ssl_method, custom_origin_server, and custom_metadata).
Using try() ensures that the custom_origin_server is only set when provided, preventing errors when it’s missing.

Define the Hostname Configurations in a Variable:

#this needs to be added in variable.tf for better organizing

variable "custom_hostnames" {
  type = map(object({
    hostname             = string
    ssl_method           = string
    custom_origin_server = optional(string)
    custom_metadata      = map(string)
  }))
  default = {
    "merchant1" = {
      hostname             = "checkout.netflix.com"
      ssl_method           = "txt"
      custom_metadata      = {
        customer          = "premium"
        security_level     = "low"
        customer_id        = "1"
        region             = "US"
        customer_noise     = "low"
      }
    }
    "merchant2" = {
      hostname             = "ajay.tf.zxc.co.in"
      ssl_method           = "http"
      custom_origin_server = "www.tf.zxc.co.in"
      custom_metadata      = {
        customer          = "premium"
        security_level     = "high"
        customer_id        = "2"
        region             = "IN"
        customer_noise     = "high"
      }
    }
    "merchant3" = {
      hostname             = "ajay2.tf.zxc.co.in"
      ssl_method           = "http"
      custom_metadata      = {
        customer          = "free"
        security_level     = "high"
        customer_id        = "3"
        region             = "IN"
        customer_noise     = "low"
      }
    }
    "merchant4" = {
      hostname             = "checkout.cloudflare.com"
      ssl_method           = "txt"
      custom_metadata      = {
        customer          = "premium"
        security_level     = "high"
        customer_id        = "4"
        region             = "US"
        customer_noise     = "low"
      }
    }
    "merchant5" = {
      hostname             = "checkout.wednesday.com"
      ssl_method           = "txt"
      custom_metadata      = {
        customer          = "premium"
        security_level     = "low"
        customer_id        = "5"
        region             = "EU"
        customer_noise     = "high"
      }
    }
    "merchant6" = {
      hostname             = "checkout.testing.com"
      ssl_method           = "txt"
      custom_metadata      = {
        customer          = "premium"
        security_level     = "high"
        customer_id        = "6"
        region             = "EU"
        customer_noise     = "high"
      }
    }
  }
}


#this needs to be added in custom_hostname.tf 
Use for_each to Iterate over the Map:

resource "cloudflare_custom_hostname" "custom_hostnames" {
  for_each = var.custom_hostnames

  zone_id  = var.ZONE_ID
  hostname = each.value.hostname

  # Conditionally set custom_origin_server if it exists
  custom_origin_server = try(each.value.custom_origin_server, null)

  ssl {
    method = each.value.ssl_method
  }

  custom_metadata = each.value.custom_metadata
}



*/