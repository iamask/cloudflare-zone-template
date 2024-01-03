resource "cloudflare_access_policy" "test_policy" {
  application_id = "f524f15e-2ed9-4dd1-8b75-333321fb6829"
  zone_id        = "bcbaeaa288da7324b61d91b0e41adc90"
  name           = "staging policy"
  precedence     = "1"
  decision       = "allow"

  include {
    email = ["test@example.com"]
  }

  require {
    email = ["test@example.com"]
  }
}