class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false, limit: 250
      t.string :content, null: false
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
