Rails.application.routes.draw do
  root 'pages#home'
  resources :pets do
    resources :trackers
  end
  resources :users, except: [:new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "/home", to: "pages#home"
  get "/about", to: "pages#about"
  get "/started", to:"pages#started"
  get "signup", to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: :logout
 
  get "/pets/:pet_id/favorites", to: 'trackers#favorites'

  # get '/auth/:provider/callback', to: 'sessions#omniauth'
  # get '/auth/failure', to: redirect('/') # Handle authentication failures

  # # Route for initiating Google login (optional, but good practice)
  # get '/auth/google_oauth2', as: :google_login

  # Route for logout
  # delete '/logout', to: 'sessions#destroy', as: :logout
  # patch "/pets/#{:pet_id}/trackers/:id", to: 'trackers#update'
  # put "/pets/#{:pet_id}/trackers/:id", to: 'trackers#update'
  # delete "/pets/:pet_id/trackers/:id", to: 'trackers#destroy'
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
