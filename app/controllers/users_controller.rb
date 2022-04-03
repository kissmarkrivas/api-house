class UsersController < ApplicationController
  skip_before_action :require_login!, only: :create

  def show
      render json: current_user
  end

  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: {errors: user.errors.full_message}, status: :unprocessable_entity
    end
  end

  def update
    if current_user.update(user_params)
      render json: current_user
    else  
      render json: { errors: current_user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  delegate :destroy, to: :current_user
  
  private

  def user_params
    params.permit(:email, :password, :first_name, :last_name :dni, :phone_number)
  end
end
