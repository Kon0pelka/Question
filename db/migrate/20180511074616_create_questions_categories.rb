class CreateQuestionsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :questions_categories do |t|
      t.integer :questions_id
      t.integer :category_id

      t.timestamps
    end
    add_index :questions_categories, :questions_id
    add_index :questions_categories, :category_id
    add_index :questions_categories, [:questions_id, :category_id], unique: true
  end
end
