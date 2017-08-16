Rails.application.routes.draw do
  get 'user/home'

  get 'user/favorites'

  get 'user/read'

  get 'user/toread'

  get 'user/reading'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
