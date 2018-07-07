class Shop < ActiveRecord::Base
  include ShopifyApp::SessionStorage
  has_many :loyality_points
  # TODO: remove index true column  

end
