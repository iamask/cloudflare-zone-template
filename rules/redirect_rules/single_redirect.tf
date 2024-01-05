# Single Redirects resource
resource "cloudflare_ruleset" "single_redirects_example" {
  zone_id     = var.ZONE_ID
  name        = "redirects"
  description = "Redirects ruleset"
  kind        = "zone"
  phase       = "http_request_dynamic_redirect"

  rules {
    action = "redirect"
    action_parameters {
      from_value {
        status_code = 301
        target_url {
          value = "/contacts/"
        }
        preserve_query_string = false
      }
    }
    expression  = "(http.request.uri.path matches \"^/contact-us/\")"
    description = "Redirect visitors still using old URL"
    enabled     = true
  }
}