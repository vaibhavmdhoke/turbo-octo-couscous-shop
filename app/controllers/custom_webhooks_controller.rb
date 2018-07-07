class CustomWebhooksController < ShopifyApp::AuthenticatedController
  include ShopifyApp::WebhookVerification
  include ShopifyApp::AppProxyVerification
  
  def order_create
  	binding.pry
    # params.permit!
    # SomeJob.perform_later(shop_domain: shop_domain, webhook: webhook_params.to_h)
    # head :no_content
  end

  # private

  # def webhook_params
  #   params.except(:controller, :action, :type)
  # end
end