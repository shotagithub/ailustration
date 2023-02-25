class CreateIllustComments < ActiveRecord::Migration[6.0]
  def change
    create_table :illust_comments do |t|
      t.references :user,        null: false, foreign_key: true
      t.references :illust,      null: false, foreign_key: true
      t.text       :text,        null: false
      t.timestamps
    end
  end
end
