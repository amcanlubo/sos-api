Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: 'users/sessions', registations: 'users/registrations'},
                       path_names: { sign_in: :login }

    resource :user, only: [:show, :update]
  end

  
end
