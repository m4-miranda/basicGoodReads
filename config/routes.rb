Rails.application.routes.draw do

  root 'books#index'

  get '/login',   to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout',  to: 'sessions#delete'

  post '/books', to: 'books#add'
  delete '/books', to: 'books#delete'
  get '/books', to:'books#show'
  patch '/books', to: 'books#update'

  post '/home', to: 'books#search'
  get '/home',  to: 'books#index'

  post '/signup',  to: 'users#create'
  get '/signup',  to: 'users#new'

  get '/settings',  to: 'lists#new'
  delete '/settings', to: 'lists#delete'
  post '/settings',  to: 'lists#create'
  patch '/settings', to: 'lists#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
end
