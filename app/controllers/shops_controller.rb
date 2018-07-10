#
# Class ShopsController provides the landing page of the application
#
# @author Vaibhav Dhoke <vmdhoke@gmail.com>
#
class ShopsController < ShopifyApp::AuthenticatedController
  def index
    domain = shop_params[:shop]
    @shop = Shop.find_by(shopify_domain: domain)
    if @shop
      @customers = @shop.customer_loyality_points.paginate(page: shop_params[:page])
    else
      @customers = nil
    end
  end

  def update
    domain = shop_domain
    shop = Shop.find_by(shopify_domain: domain)
    shop.points_per_spent = shop_params[:reward_per_dollar]
    value = shop.save
    render json: { success: value }
  end

  private

  def shop_params
    params.permit(:hmac, :locale, :protocol, :shop, :timestamp, :reward_per_dollar, :page)
  end

  def shop_domain
    CGI::parse(request.headers.env['HTTP_REFERER'])['shop'].first
  end
end
