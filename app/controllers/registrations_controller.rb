class RegistrationsController < ApplicationController
  before_action :authenticate_user

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
      render json: { status: 500 }
    end
  end
end
