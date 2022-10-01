class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, limit: 200
      t.string :username, null: false, limit: 200
      t.string :email,null: false
      t.string :password_digest
      t.timestamps
    end
  end
end
