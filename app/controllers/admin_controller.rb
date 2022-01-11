class AdminController < ApplicationController
  
    before_action :is_admin

    def people_in_emergency
        @in_emergency = Emergency.where(on_going: true) 
        render json: @in_emergency
    end

    # def approve
    #     respond_to do |format|
    #         @user = User.find(params[:id]).update(is_approved:true)
    #         ApprovalMailer.with(user: User.find(params[:id])).welcome_email.deliver_now
    #         format.html{redirect_to admin_index_path}
    #     end
    # end

    # def new
    #     @user = User.new
    # end


    # def create
    #     @user = User.new(user_params)
    #     @user.skip_confirmation!
    #         if @user.save
    #             redirect_to admin_index_path
    #             flash[:notice] = "User was successfully created."
    #         else
    #             render :new
    #         end
    # end

    # def show
    #     @user = User.find(params[:id])
    # end

    # def edit
    #     @user = User.find(params[:id])
    # end

    # def update
    #     @user = User.find(params[:id])
    #     respond_to do |format|
    #         if @user.update(user_params)
    #           format.html { redirect_to admin_path(params[:id]), notice: "User profile was successfully updated" }
    #         else
    #           format.html { render :edit, status: :unprocessable_entity }
    #         end
    #     end
    # end

    private
    #     def user_params
    #         params.require(:user).permit(:email, :password, :first_name, :last_name, :balance)
    #     end

        def is_admin
            if request.headers["Authorization"] && current_user.is_admin
                return true
            else
                render json: { errors: 'not permitted' }, status: 401
            end
        end      
end
