class AddPointsPerSpentToShop < ActiveRecord::Migration[5.1]
  def change
    add_column :shops, :points_per_spent, :integer, default: 1
  end
end
