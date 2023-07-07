class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :item_id, null: false
      t.integer :customer_id, null: false
      t.float :rate, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
