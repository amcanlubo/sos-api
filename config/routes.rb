Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: 'users/sessions', registations: 'users/registrations' },
                       path_names: { sign_in: :login }

    resource :user, only: [:show, :update]
    resource :emergency
    resource :admin
    get 'people_in_emergency' => 'admins#people_in_emergency', as: :people_in_emergency
    get 'all_emergencies' => 'emergencies#all_emergencies', as: :all_emergencies
    get 'all_users' => 'admins#all_users', as: :all_users
    patch 'toggle_emergency' => 'admins#toggle_emergency', as: :toggle_emergency
    delete 'delete/:id' => 'admins#delete', as: :delete
  end
end 
