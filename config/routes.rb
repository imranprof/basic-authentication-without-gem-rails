Rails.application.routes.draw do
  get 'sessions/new'
  resources :posts
  root 'sessions#new'
  get '/register', to: 'users#new', as: 'register'
  resources :users, only: [:create]

  get '/sign_in', to: 'sessions#new', as: 'sign_in'
  get '/sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
