resource "cloudflare_load_balancer_pool" "example" {
  account_id = "174f936387e2cf4c433752dc46ba6bb1"
  name       = "azure"
  origins = [{
    name    = "example-1"
    address = "192.0.2.1"
    enabled = false
    header = [{
      header = "Host"
      values = ["example-1"]
    }]
    },
    {
      name    = "example-2"
      address = "192.0.2.2"
      header = [{
        header = "Host"
        values = ["example-2.zxc.co.in"]
      }]
  }]
  latitude           = 55
  longitude          = -12
  description        = "example load balancer pool"
  enabled            = false
  minimum_origins    = 1
  notification_email = "admin@zxc.co.in"
  origin_steering = {
    policy = "random"
  }
}