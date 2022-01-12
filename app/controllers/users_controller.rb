class UsersController < ApplicationController
    before_action :authenticate_user!

    def show
    end

    def update
      @user = User.find_by(id:current_user.id)
      if @user.update(user_params)
        render json: @user
      else
        render json: { errors: current_user.errors }, status: :unprocessable_entity
      end
    end

   

    private

    def user_params
        params.require(:user).permit(:email, :password, :first_name, :last_name, :mobile_number)
    end

end