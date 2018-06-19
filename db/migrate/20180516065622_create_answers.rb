class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.integer :question_id
      t.integer :autor_id
      t.text :info

      t.timestamps
    end
    add_index :answers, :question_id
    add_index :answers, :autor_id
    add_index :answers, [:question_id, :autor_id], unique: true
  end
end
