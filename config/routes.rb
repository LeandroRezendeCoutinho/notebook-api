Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auths'
  resources :auths, only: [:create]
  resources :kinds
  resources :contacts do
    resource :kind, only: [:show]
    resource :kind, only: [:show], path: 'relationships/kind'

    resource :phones, only: [:show]
    resource :phones, only: [:show], path: 'relationships/phones'

    resource :phone, only: [:update, :destroy, :create]

    resource :address, only: [:show, :update, :destroy, :create]
    resource :address, only: [:show, :update, :destroy, :create], path: 'relationships/address'
  end
end
