class EmergenciesController < ApplicationController
    before_action :authenticate_user!

    def all_emergencies
        @emergencies = Emergency.where(on_going: false)

        render json: @emergencies
    end
 
    def create
        @emergency = Emergency.new(
            longitude: params[:longitude],
            latitude: params[:latitude],
            emergency_type: params[:emergency_type],
            user_id: current_user.id,
            first_name: current_user.first_name,
            last_name: current_user.last_name
        )
        if @emergency.save
            # render json: @emergency
            ActionCable.server.broadcast 'emergencies_channel', @emergency
            head :ok
        else
            render json: { errors: 'Error!' }
            head :ok
        end
    end

    private

    def emergency_params
        params.require(:emergency).permit(:longitude, :latitude, :emergency_type)
    end

end