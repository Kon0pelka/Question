class Api::V1::CategoriesController < ApplicationController
  before_action :authenticate_user
  before_action :admin_user
  before_action :set_category, only: [:show]

  def show
    render json: @category
  end

  def index
    categories = Category.all
    render json: categories
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: Category.all, status: :created, location: api_v1_categories
    else
      render json: category.errors, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
