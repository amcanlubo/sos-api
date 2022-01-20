Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: 'users/sessions', registations: 'users/registrations' },
                       path_names: { sign_in: :login }

    resource :user, only: [:show, :update]
    resource :emergency
    resource :admin
    get 'people_in_emergency' => 'admins#people_in_emergency', as: :people_in_emergency
  end
end
