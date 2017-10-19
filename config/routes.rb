Rails.application.routes.draw do
  root to: 'users#homepage'
  resources :users

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :attractions, only: [:new, :show, :index, :create, :edit, :update]

  post '/rides/new' => 'rides#new'
end
