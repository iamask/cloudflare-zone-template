resource "cloudflare_access_policy" "test_policy" {
  application_id = "187cf141-41ab-4486-a247-364857b2b3b8"
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