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
  get "/favorites", to: "pages#favorites"
  get "signup", to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  # get "/pets/#{:pet_id}/trackers", to: 'trackers#index'
  # post "/pets/#{:pet_id}/trackers", to: 'trackers#create'
  # get "/pets/#{:id}/trackers/new", to: 'trackers#new'

  # get "/pets/#{:pet_id}/trackers/:id/edit", to: 'trackers#edit'
  # get "/pets/#{:pet_id}/trackers/:id", to: 'trackers#show'
  # patch "/pets/#{:pet_id}/trackers/:id", to: 'trackers#update'
  # put "/pets/#{:pet_id}/trackers/:id", to: 'trackers#update'
  # delete "/pets/:pet_id/trackers/:id", to: 'trackers#destroy'
  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
