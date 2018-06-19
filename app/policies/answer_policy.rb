class AnswerPolicy < ApplicationPolicy
  attr_reader :user, :answer

    def initialize(user, answer)
      @user  = user
      @answer = answer

    end

    def create?
      answer.question.open?
    end

    def update?
      answer.question.open?
    end
end
