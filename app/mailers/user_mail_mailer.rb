class UserMailMailer < ActionMailer::Base
    default from: 'max12341rus@gmail.com'

    def answer_set(user, question)
        @user=user
        @question=question
        mail(to: @user.email, 
             subject: 'New answer for your question')
    end

    def best_answer(user, question)
        @user=user
        @question=question
        mail(to: @user.email,
             subject: 'Your answer best')
    end

    def question_close(user, question)
        @user=user
        @question=question
        mail(to: @user.email,
             subject: 'Question close!')
    end
end
