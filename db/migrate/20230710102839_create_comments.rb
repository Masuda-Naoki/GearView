class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :comment_content
      t.references :customer, foreign_key: true
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
