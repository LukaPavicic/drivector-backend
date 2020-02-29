Rails.application.routes.draw do

  concern :base_api do
    post 'users/register', to: 'users#register'
    post 'users/login', to: 'users#login'
    get 'users/current_user', to: 'users#current_user_data'
  end

  namespace :v1 do
    concerns :base_api
  end
end
