class CreateProductComments < ActiveRecord::Migration[6.0]
  def change
    create_table :product_comments do |t|
      t.references :user,        null: false, foreign_key: true
      t.references :product,     null: false, foreign_key: true
      t.text       :text,        null: false
      t.timestamps
    end
  end
end
