module "dev_shared_groups" {
  source      = "../../modules/okta-groups"
  group_names = ["FT_DEV_SHARED"]
}

module "dev_web_oidc" {
  source        = "../../modules/okta-app-web-oidc"
  label         = "ft-portal-dev"
  redirect_uris = ["https://dev.portal.ft.com/callback"]
  post_logout_redirect_uris = ["https://dev.portal.ft.com"]
  group_ids     = [for g in module.dev_shared_groups.groups : g.id]
}
