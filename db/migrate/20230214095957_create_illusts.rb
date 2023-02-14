class CreateIllusts < ActiveRecord::Migration[6.0]
  def change
    create_table :illusts do |t|
      t.references :user,        null: false, foreign_key: true
      t.string     :title,       null: false
      t.text       :description, null: false
      t.string     :application, null: false
      t.text       :prompt,      null: false
      t.timestamps
    end
  end
end
