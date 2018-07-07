class AddShopToLoyalityPoint < ActiveRecord::Migration[5.1]
  def change
    add_reference :loyality_points, :shop, foreign_key: true
  end
end
