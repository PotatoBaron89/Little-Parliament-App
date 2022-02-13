class SessionsController < ApplicationController
  include CurrentUserConcern        # Retreives current user information

  # Create a new session, requires existing User account
  def create
    user = User
             .find_by(email: params['user']['email'])
             .try(:authenticate, params['user']['password'])

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
      }
    else
      # Handle failed log in attempt
      render json: { status: 401, message: "Invalid credentials" }
    end
  end

  # Return json info as to whether or not the current user is logged in
  def logged_in
    if @current_user
      render json: {
        logged_in: true,
        user: @current_user
      }
    else
      render json: {
        logged_in: false
      }
    end
  end

  # Allow a user to manually end their session early
  def logout
    reset_session
    render json: { status: 200, logged_out: true }
  end
end
