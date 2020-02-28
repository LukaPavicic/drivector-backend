Rails.application.routes.draw do

  concern :base_api do
    post 'users/register', to: 'users#register'
    post 'users/login', to: 'users#login'
  end

  namespace :v1 do
    concerns :base_api
  end
end
