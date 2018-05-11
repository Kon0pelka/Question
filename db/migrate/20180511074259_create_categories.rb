class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name, limit: 50, null:false
      t.integer :questions_category_id

      t.timestamps
    end
    add_index :categories, :questions_category_id
  end
end
