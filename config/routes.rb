Rails.application.routes.draw do
  mount StripeEvent::Engine, at: "/stripe/webhook"
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
    post 'vtcs/:vtc_id/update_socials', to: "vtcs#update_socials"
    get 'vtcs/:vtc_id/retrieve_employees', to: "vtcs#retrieve_employees"
    # User Joined Vtcs
    get 'user_joined_vtcs', to: "user_joined_vtc#index"
    post 'user_joined_vtcs/create', to: "user_joined_vtc#create"
    delete 'user_joined_vtcs/kick', to: "user_joined_vtc#kick"
    post 'user_joined_vtcs/promote', to: "user_joined_vtc#promote"
    post 'user_joined_vtcs/demote', to: "user_joined_vtc#demote"
    # Jobs
    get 'jobs', to: "jobs#index"
    post 'jobs/create', to: "jobs#create"
    get 'jobs/daily_stats', to: "jobs#daily_statistics"
    get 'jobs/today', to: "jobs#today_jobs"
    get 'jobs/vtc', to: "jobs#vtc_jobs"
    get 'jobs/all_time_stats', to: "jobs#all_time_statistics"
    # Subscriptions
    post 'subscription', to: "subscriptions#create"
    # Join Requests
    post 'join_request/new', to: "join_requests#create"
    get 'join_requests/vtc_requests', to: "join_requests#retrieve_for_vtc"
    post 'join_request/handle', to: "join_requests#handle_join_request"
    get 'join_requests/user_requests', to: "join_requests#retrieve_for_user"
    # Events
    post 'events/create', to: "events#create"
    get 'events/vtc_events', to: "events#vtc_events"
  end

  namespace :v1 do
    concerns :base_api
  end
end
