class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  include CurrentUserConcern
  session[:user_id] = users(:one).id

  def authenticate_user
    if @current_user
      true
    else
      render json: { status: 500 }
      false
    end
  end
end
