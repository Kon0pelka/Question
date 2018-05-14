class Api::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show]

  def show
    render json: @question
  end

  def index
    @questions = Question.page(params[:page]).per(params[:per_page]).includes(:author)
    render json: @questions
  end

  def create
    @categorys = Category.all
    @question = current_user.question.build(question_params)
    if @question.save
      #Questionsz_categorie.create!( )
      render json: @question, status: :created, location: api_v1_post_url(@question)
    else
      render json: { errors: @question.errors.full_messages }, status: :unprocessable_entity
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
