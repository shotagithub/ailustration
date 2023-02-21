class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.references :user,        null: false, foreign_key: true
      t.string     :title,       null: false
      t.integer    :price,       null: false
      t.text       :description, null: false
      t.string     :application, null: false
      t.timestamps
    end
  end
end
