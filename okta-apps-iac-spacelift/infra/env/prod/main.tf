module "prod_shared_groups" {
  source      = "../../modules/okta-groups"
  group_names = ["FT_PROD_SHARED"]
}

module "prod_web_oidc" {
  source        = "../../modules/okta-app-web-oidc"
  label         = "ft-portal-prod"
  redirect_uris = ["https://prod.portal.ft.com/callback"]
  post_logout_redirect_uris = ["https://prod.portal.ft.com"]
  group_ids     = [for g in module.prod_shared_groups.groups : g.id]
}
