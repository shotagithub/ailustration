class CreateNovelComments < ActiveRecord::Migration[6.0]
  def change
    create_table :novel_comments do |t|
      t.references :user,        null: false, foreign_key: true
      t.references :novel,      null: false, foreign_key: true
      t.text       :text,        null: false
      t.timestamps
    end
  end
end
