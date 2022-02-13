class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token     # need to skip this for an API server
  include CurrentUserConcern
  include Pundit::Authorization

  # Check user is authenticated
  def authenticate_user
    if @current_user
      true
    else
      render json: { status: 500, message: "Unable to authenticate user" }
      false
    end
  end
end
