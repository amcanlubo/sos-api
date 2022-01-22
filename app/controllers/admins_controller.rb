class AdminsController < ApplicationController
  
    before_action :is_admin

    def user_date
    end

    def all_users
        @users = User.where(is_admin: false)

        render json: @users
    end

    def toggle_emergency
        @emergency = Emergency.find(params[:id])
        @emergency.update(on_going: false)

        render json: {message: 'Success!'}
    end

    def people_in_emergency
        @in_emergency = Emergency.where(on_going: true) 
        render json: @in_emergency
    end


    def create
        @user = User.new(user_params)
        @user.skip_confirmation!
        if @user.save
            render json: @user
        else
            render json: { errors: 'User was not created' }
        end
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user, message: "User successfully updated"
        else
            render json: { errors: "Check errors" }
        end
    end

    def delete
        @user = User.find(params[:id]).destroy

        render json: { message: 'User deleted'}
    end

    private
        def user_params
            params.require(:user).permit(:email, :password, :first_name, :last_name, :mobile_number)
        end

        def is_admin
            if request.headers["Authorization"] && current_user.is_admin
                return true
            else
                render json: { errors: 'not permitted' }, status: 401
            end
        end      
end
