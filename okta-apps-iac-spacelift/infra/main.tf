# Example root composition (optional if using env/* entrypoints)

module "web_oidc_example" {
  source        = "./modules/okta-app-web-oidc"
  label         = "example-web-oidc"
  redirect_uris = ["http://localhost:3000/callback"]
  post_logout_redirect_uris = ["http://localhost:3000"]
  group_names   = ["EXAMPLE_WEB_OIDC_DEVS"]
}
