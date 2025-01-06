# HTTP
resource "cloudflare_load_balancer_monitor" "zxc.co.in" {
  account_id     = "174f936387e2cf4c433752dc46ba6bb1"
  type           = "https"
  expected_body  = "alive"
  expected_codes = "200"
  method         = "GET"
  timeout        = 7
  path           = "/health"
  interval       = 60
  retries        = 5
  description    = "example http load balancer"
  header = [{
    header = "Host"
    values = ["1.zxc.co.in"]
  }]
  allow_insecure   = false
  follow_redirects = true
  probe_zone       = "tf.zxc.co.in"
}