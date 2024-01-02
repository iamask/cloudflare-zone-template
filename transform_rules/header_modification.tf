resource "cloudflare_ruleset" "transform_modify_request_headers" {
  zone_id     = "<bcbaeaa288da7324b61d91b0e41adc90"
  name        = "Transform Rule performing HTTP request header modifications"
  description = ""
  kind        = "zone"
  phase       = "http_request_late_transform"

  rules {
    action = "rewrite"
    action_parameters {
      headers {
        name      = "my-header-1"
        operation = "set"
        value     = "Fixed value"
      }
      headers {
        name       = "my-header-2"
        operation  = "set"
        expression = "cf.zone.name"
      }
      headers {
        name      = "existing-header"
        operation = "remove"
      }
    }
    expression = "true"
    description = "Example HTTP Request Header Modification Rule"
    enabled = true
  }
}