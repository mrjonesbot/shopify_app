_creds = Rails.application.credentials
shopify_creds = _creds[:shopify]

ShopifyApp.configure do |config|
  config.application_name = "My Shopify App"
  config.api_key = shopify_creds[:api_key]
  config.secret = shopify_creds[:secret]
  config.old_secret = ""
  config.scope = "read_products" # Consult this page for more scope options:
                                 # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.embedded_app = true
  config.after_authenticate_job = false
  config.api_version = "2020-04"
  config.shop_session_repository = 'Shop'
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known
