module "staging_shared_groups" {
  source      = "../../modules/okta-groups"
  group_names = ["FT_STAGING_SHARED"]
}

module "staging_web_oidc" {
  source        = "../../modules/okta-app-web-oidc"
  label         = "ft-portal-staging"
  redirect_uris = ["https://staging.portal.ft.com/callback"]
  post_logout_redirect_uris = ["https://staging.portal.ft.com"]
  group_ids     = [for g in module.staging_shared_groups.groups : g.id]
}
