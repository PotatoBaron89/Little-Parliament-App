module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def check_permissions
    render json: { status: 401, message: 'Insufficient permissions' } unless @current_user.has_role? :admin
  end
end
