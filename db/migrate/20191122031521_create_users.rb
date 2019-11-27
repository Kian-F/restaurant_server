class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :address, :optional => true
      t.boolean :admin, :default => false
      t.string :password_digest

      t.timestamps
    end

    add_index :users, %i(email), unique: true
  end
end
