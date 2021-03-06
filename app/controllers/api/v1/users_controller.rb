class Api::V1::UsersController < ApplicationController
  
  def create
    user = User.new(user_params)
    if user.save
      render head: :no_content, status: :created
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  private 

  def user_params
    params.require(:user).permit(:email, :password, :nick)
  end

end
