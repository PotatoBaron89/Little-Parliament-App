class RegistrationsController < ApplicationController

  # Allow a new user to be created
  def create
    render json: { msg: "hello"}
    user = User.create!(
      email: params['user']['email'],
      password: params['user']['password']
    )

    if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      # Handle failed attempt at creating a new user
      render json: { status: 500, message: user.errors }
    end
  end
end
