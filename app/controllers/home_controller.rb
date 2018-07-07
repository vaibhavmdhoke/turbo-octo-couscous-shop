class HomeController < ShopifyApp::AuthenticatedController
  def index
  	# binding.pry
    @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    @webhooks = ShopifyAPI::Webhook.find(:all)
  end

  

end

