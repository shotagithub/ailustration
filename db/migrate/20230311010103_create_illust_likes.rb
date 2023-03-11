class CreateIllustLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :illust_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :illust, null: false, foreign_key: true
      t.timestamps
    end
  end
end
