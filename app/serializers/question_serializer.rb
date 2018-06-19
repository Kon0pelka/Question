class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :info, :created_at

  has_many :answers
  belongs_to :answer, key: :best_answer
  has_many :categories
  belongs_to :autor, key: :writer
end
