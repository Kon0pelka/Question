class Api::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show]
  before_action :authenticate_user, only: [:create, :best_answer]

  def show
    render json: @question, includes: :answers
  end

  def index
    questions = Question.page(params[:page]).per(10).includes(:autor)
    render json: questions, include: :autor
  end

  def create
    categ = params[:question][:categories]
    question = current_user.questions.build(question_params)
    question.categories = Category.find(categ)
    if question.save
      render json: question, status: :created, location: api_v1_question_url(question)
    else
      render json: { errors: question.errors.full_messages }, status: :unprocessable_entity
    end   
  end

  def best_answer
    question = current_user.questions.find(params[:question_id])
    answer = question.answers.find(params[:answer_id])
    if answer
      question.close_question(answer)
      render json: question, status: :accepted, location: api_v1_question_url(question)
    else
    render json: question, status: :unprocessable_entity, location: api_v1_question_url(question)
    end
  end

  private 

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:title, :info)
  end
end
