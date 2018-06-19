class Answer < ApplicationRecord
    belongs_to :autor, class_name: 'User'
    belongs_to :question
    default_scope -> { order(created_at: :desc) }
end
