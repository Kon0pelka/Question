class HardWorker
  include Sidekiq::Worker

  def perform()
    
  end

  #def best_answer(user, question)
 #   @user = user
 #   @question = question
 #   UserMailMailer.delay.best_answer(@user, @question)
 # end

 # def close(answers, question)
 #   @answers = answers
 #   @question = question
 #   @answers.each do |answer|
 #     if @question.answer_id != answer.id
 #       UserMailMailer.delay.question_close(answer.autor, @question)
 #     end
 #   end
 # end
end
