class CreateNovelLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :novel_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :novel, null: false, foreign_key: true
      t.timestamps
    end
  end
end
