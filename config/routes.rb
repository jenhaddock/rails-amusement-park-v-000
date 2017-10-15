Rails.application.routes.draw do
  root to: 'users#homepage'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  resources :users
end
