# Okta Apps IaC with Spacelift (OpenTofu/Terraform)

See repository README for overview. This doc focuses on connecting GitHub → Spacelift and required variables.

## Provider Variables (Stack or Space)
- `TF_VAR_okta_org_name` (Plain) e.g. `dev-12345678`
- `TF_VAR_okta_base_url` (Plain) one of `okta.com`, `okta-emea.com`, `oktapreview.com`
- `TF_VAR_okta_api_token` (Secret) raw token *without* `SSWS `

## Project Roots
- Single env: `infra`
- Multi env (recommended): `infra/env/dev`, `infra/env/staging`, `infra/env/prod`

## Troubleshooting
- 401 Unauthorized → org/base_url/token mismatch; do not use custom vanity domain.
- “project root does not exist” → case-sensitive path mismatch.
- Rate limit → split deployments, re-run.
