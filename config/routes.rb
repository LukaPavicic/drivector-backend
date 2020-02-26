Rails.application.routes.draw do  
  post '/user/register', to: "users#register"
  post '/user/login', to: "users#login"
end
