resource "cloudflare_load_balancer" "example" {
  zone_id          = "174f936387e2cf4c433752dc46ba6bb1"
  name             = "example-load-balancer.example.com"
  fallback_pool_id = cloudflare_load_balancer_pool.example.id
  default_pool_ids = [cloudflare_load_balancer_pool.example.id]
  description      = "example load balancer using geo-balancing"
  proxied          = true
  steering_policy  = "geo"

  pop_pools = [{
    pop      = "LAX"
    pool_ids = [cloudflare_load_balancer_pool.example.id]
  }]

  country_pools = [{
    country  = "US"
    pool_ids = [cloudflare_load_balancer_pool.example.id]
  }]

  region_pools = [{
    region   = "WNAM"
    pool_ids = [cloudflare_load_balancer_pool.example.id]
  }]

  rules = [{
    name      = "example rule"
    condition = "http.request.uri.path contains \"testing\""
    fixed_response = {
      message_body = "hello"
      status_code  = 200
      content_type = "html"
      location     = "www.example.com"
    }
  }]
}

resource "cloudflare_load_balancer_pool" "example" {
  name = "example-lb-pool"
  origins = [{
    name    = "example-1"
    address = "192.0.2.1"
    enabled = false
  }]
}