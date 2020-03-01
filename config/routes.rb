Rails.application.routes.draw do

  concern :base_api do
    # Users
    post 'users/register', to: 'users#register'
    post 'users/login', to: 'users#login'
    get 'users/current_user', to: 'users#current_user_data'
    # Vtcs
    post 'vtcs/create', to: "vtcs#create"
    get 'vtcs', to: "vtcs#index"
    get 'vtcs/:vtc_id', to: "vtcs#retrieve"
  end

  namespace :v1 do
    concerns :base_api
  end
end
