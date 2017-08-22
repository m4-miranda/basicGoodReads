Rails.application.routes.draw do
  get 'lists/new'

  get '/lists', to: 'lists#show'

  root 'sessions#new'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout',  to: 'sessions#delete'

  post '/lists', to: 'lists#add'

  post '/home', to: 'books#index'
  get '/home',  to: 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
