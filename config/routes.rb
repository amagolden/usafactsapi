Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/expense', to: 'expense#index'
  post '/expense', to: 'expense#create'
  get '/expense/:id', to: 'expense#show'
  patch '/expense/:id', to: 'expense#update'
  delete '/expense/:id', to: 'expense#destroy'

  get '/revenue', to: 'orevenueindex'
  post '/revenue', to: 'revenue#create'
  get '/revenue/:id', to: 'revenue#show'
  patch '/revenue/:id', to: 'revenue#update'
  delete '/revenue/:id', to: 'revenue#destroy'
end
