class CreateLoyalityPoints < ActiveRecord::Migration[5.1]
  def change
    create_table :loyality_points do |t|
      t.string :email
      t.float :balance_points
      t.string :first_name
      t.string :last_name
      t.integer :provided_customer_id
      t.integer :provided_id

      t.timestamps
    end
  end
end
