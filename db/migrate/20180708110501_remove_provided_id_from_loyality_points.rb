class RemoveProvidedIdFromLoyalityPoints < ActiveRecord::Migration[5.1]
  def change
    remove_column :loyality_points, :provided_id, :integer
  end
end
