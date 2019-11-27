class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.float :price
      t.string :image
      t.integer :stars
      t.timestamps
    end
  end
end
