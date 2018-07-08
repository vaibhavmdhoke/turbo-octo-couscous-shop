class AddPreviousOrderPointsToLoyalityPoints < ActiveRecord::Migration[5.1]
  def change
    add_column :loyality_points, :previous_order_points, :float , default: 0
  end
end
