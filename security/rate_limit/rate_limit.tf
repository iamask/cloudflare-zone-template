
resource "cloudflare_ruleset" "zone_rl" {
  zone_id     = var.ZONE_ID
  name        = "Phase entry point ruleset for RL"
  description = "RL"
  kind        = "zone"
  phase       = "http_ratelimit"

  rules {
    action      = "managed_challenge"
    ratelimit{
                    characteristics = ["cf.unique_visitor_id", "cf.colo.id" ]
                    period = 10
                    requests_per_period = 20
                    mitigation_timeout = 0
                }
    expression  = "(http.host eq \"uandustdev.ustdev.com\")"
    description = "RL baseline 1 (Burst)- 20/10sec "
    enabled     = true
  }

  rules {
    action      = "managed_challenge"
    ratelimit{
                    characteristics = ["cf.unique_visitor_id", "cf.colo.id" ]
                    period = 60
                    requests_per_period = 100
                    mitigation_timeout = 0
                }
    expression  = "(http.host eq \"uandustdev.ustdev.com\")"
    description = "RL baseline 2 (Burst)- 100/60sec"
    enabled     = true
  }


  rules {
    action      = "managed_challenge"
    ratelimit{
                    characteristics = ["cf.unique_visitor_id", "cf.colo.id" ]
                    period = 600
                    requests_per_period = 2000
                    mitigation_timeout = 0
                }
    expression  = "(http.host eq \"uandustdev.ustdev.com\")"
    description = "RL baseline 3 (Slow and Low)- 2000/10Min"
    enabled     = true
  }

}






