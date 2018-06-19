class Api::V1::AnswersController < ApplicationController
  before_action :authenticate_user
#  before_action :admin_user, only: [:index]
  before_action :set_answer, only: [:delete, :update]

  def index
    answers = Answer.where(question_id: params[:question_id]).page(params[:page]).per(10).includes(:autor)
    render json: answers
  end

  def create
    answer = current_user.answers.build(answer_params)
    answer.question_id = params[:question_id]
    authorize answer
    if answer.save
      render json: answer.question, status: :created, location: api_v1_question_url(answer.question)
    else
      render json: { errors: answer.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    authorize @answer
    if @answer.update_attributes(answer_params)
      render json: @answer.question, status: :accepted
    else
      render json: { errors: @answer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def set_answer
    @answer = current_user.answers.find(params[:id])
  end

  def answer_params 
    params.require(:answer).permit(:info)
  end
end
