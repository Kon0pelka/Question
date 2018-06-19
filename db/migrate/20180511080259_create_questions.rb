class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title, limit: 64
      t.text :info, null: false
      t.integer :status, default: "0"
      t.integer :autor_id, null: false

      t.timestamps
    end
    add_index :questions, :autor_id
  end
end
