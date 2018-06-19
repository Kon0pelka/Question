class Question < ApplicationRecord
    has_many :questions_categories
    has_many :categories, through: :questions_categories
    belongs_to :autor, class_name: 'User'
    has_many :answers
    belongs_to :answer, foreign_key: "answer_id", optional: true
    default_scope -> { order(created_at: :desc) }
    validates :title, presence: true, length: { maximum: 64 }
    validates :info, presence: true
    enum status: [:open, :close]

    def close_question(answer)
        update_attributes(answer: answer,status: :close)
    end
end
