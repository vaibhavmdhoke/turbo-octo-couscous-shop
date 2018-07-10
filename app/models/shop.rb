class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage
  has_many :customer_loyality_points, class_name: "Customer::LoyalityPoint"

end
