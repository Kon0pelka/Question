class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, limit: 255
      t.string :nick, limit: 50
      t.string :password, limit: 30

      t.timestamps
    end
    add_index :users, :email, unique: true
    add_index :users, :nick, unique: true
  end
end
