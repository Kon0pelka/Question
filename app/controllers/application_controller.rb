class ApplicationController < ActionController::API
  include Knock::Authenticable
  include Pundit

  rescue_from Pundit::NotAuthorizedError, :with => :error_render_method 
  
  def error_render_method 
    render json: { error: "The question is closed"}, status: :unprocessable_entity, location: api_v1_questions_url()
  end

  private

  def authenticate_v1_user
    authenticate_for Api::V1::User
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
