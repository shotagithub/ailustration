class CreateNovels < ActiveRecord::Migration[6.0]
  def change
    create_table :novels do |t|
      t.references :user,        null: false, foreign_key: true
      t.string     :title,       null: false
      t.string     :application
      t.timestamps
    end
  end
end
