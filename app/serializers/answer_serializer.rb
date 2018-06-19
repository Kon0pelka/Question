class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :info, :question_id, :created_at
  belongs_to :autor
end
