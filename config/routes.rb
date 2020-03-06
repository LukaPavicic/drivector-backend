Rails.application.routes.draw do

  concern :base_api do
    # Users
    post 'users/register', to: 'users#register'
    post 'users/login', to: 'users#login'
    get 'users/current_user', to: 'users#current_user_data'
    get 'users/:user_id', to: 'users#retrieve'
    get 'users', to: "users#index"
    # Vtcs
    post 'vtcs/create', to: "vtcs#create"
    get 'vtcs', to: "vtcs#index"
    get 'vtcs/:vtc_id', to: "vtcs#retrieve"
    # User Joined Vtcs
    get 'user_joined_vtcs', to: "user_joined_vtc#index"
    post 'user_joined_vtcs/create', to: "user_joined_vtc#create"
  end

  namespace :v1 do
    concerns :base_api
  end
end
