class CreateOrderJob < ActiveJob::Base

  #
  # Create job from webhook, add entry in db
  ### spent per $ as per requirement
  #
  # @param [<type>] shop_domain: <description>
  # @param [<type>] webhook: <description>
  #
  # @return [<type>] <description>
  # 
  def perform(shop_domain:, webhook:)
    shop = Shop.find_by(shopify_domain: shop_domain)
    customer = webhook[:customer]
    total_spent = webhook[:total_price_usd].to_f
    shop.with_shopify_session do
      loyality_customer = LoyalityPoint.find_or_initialize_by(provided_customer_id: customer[:id],
                                                              shop_id: shop.id)
      points_earned = (shop.points_per_spent * total_spent)
      ### Rely on customer_id provided by shop, as it will have updated info
      loyality_customer.email = customer[:email]
      loyality_customer.first_name = customer[:first_name]
      loyality_customer.last_name = customer[:last_name]
      loyality_customer.previous_order_points = points_earned
      if loyality_customer.balance_points.present? && loyality_customer.balance_points > 0
        loyality_customer.balance_points += points_earned
      else
        loyality_customer.balance_points = points_earned
      end
      loyality_customer.save
    end
  end
end

