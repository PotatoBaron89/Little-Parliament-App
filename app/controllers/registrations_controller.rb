class RegistrationsController < ApplicationController

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
      render json: { status: 500, message: "Failed to authenticate user" }
    end
  end
end
