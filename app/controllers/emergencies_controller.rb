class EmergenciesController < ApplicationController
    before_action :authenticate_user!
 
    def create
        @emergency = Emergency.new(
            longitude: params[:longitude],
            latitude: params[:latitude],
            emergency_type: params[:emergency_type],
            user_id: current_user.id
        )
        if @emergency.save
            render json: @emergency
        else
            render json: { errors: 'Error!' }
        end
    end

    private

    def emergency_params
        params.require(:emergency).permit(:longitude, :latitude, :emergency_type)
    end

end