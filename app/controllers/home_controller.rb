class HomeController < ShopifyApp::AuthenticatedController
  def index
    # @products = ShopifyAPI::Product.find(:all, params: { limit: 10 })
    # @webhooks = ShopifyAPI::Webhook.find(:all)
    domain = params[:shop]
    shop = Shop.find_by(shopify_domain: domain)
    if shop
      @customers = shop.customer_loyality_points.paginate(page: params[:page])
    else
      @customers = nil
    end
  end

  ## TODO: Filter params
  def update
    domain = shop_domain
    shop = Shop.find_by(shopify_domain: domain)
    shop.points_per_spent = params[:reward_per_dollar]
    value = shop.save
    render json: { success: value }
  end

  private

  def shop_domain
    CGI::parse(request.headers.env['HTTP_REFERER'])['shop'].first
  end

end

