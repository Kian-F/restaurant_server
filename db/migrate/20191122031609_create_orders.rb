class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.float :total_price
      t.integer :user_id
      t.string :kind

      t.timestamps
    end
  end
end
