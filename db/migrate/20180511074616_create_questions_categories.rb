class CreateQuestionsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :questions_categories do |t|
      t.integer :question_id
      t.integer :category_id

      t.timestamps
    end
    add_index :questions_categories, :question_id
    add_index :questions_categories, :category_id
    add_index :questions_categories, [:question_id, :category_id], unique: true
  end
end
