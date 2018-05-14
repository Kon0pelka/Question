class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title, limit: 50
      t.text :info, null:false
      t.integer :category_id, null:false
      t.boolean :status
      t.integer :autor_id, null:false

      t.timestamps
    end
    add_index :questions, :category_id
    add_index :questions, :autor_id
  end
end
