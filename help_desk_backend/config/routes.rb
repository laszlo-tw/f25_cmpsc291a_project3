Rails.application.routes.draw do
  # health check endpoint
  get '/health', to: 'health#check'
    # defines a GET endpoint at /health
    # routes to HealthController#check action

  # authentication routes
  post '/auth/register', to: 'auth#register'
  post '/auth/login', to: 'auth#login'
  post '/auth/logout', to: 'auth#logout'
  post '/auth/refresh', to: 'auth#refresh'
  get '/auth/me', to: 'auth#me'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
