class UserMailMailer < ApplicationMailer

    def answer_set(user)
        @user=user
        mail(to: @user.email 
             subject: 'New answer for your question',)
    end

    def best_answer(user)
        @user=user
        mail(to: @user.email
             subject: 'Your answer best')
    end

    def question_close(user)
        @user=user
        mail(to: @user.email
             subject: 'Question is close')
    end
end
