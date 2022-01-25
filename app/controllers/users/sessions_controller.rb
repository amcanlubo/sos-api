# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(sign_in_params[:email])
    

    if user && user.valid_password?(sign_in_params[:password])
      token = User.generate_jwt(user.id)
      render json: { user: current_user, token: token , status: 200}
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end
