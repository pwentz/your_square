Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  get '/', to: 'root#show', as: 'root'
  get '/dashboard', to: 'users#show', as: 'dashboard'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/auth/foursquare/callback', to: 'sessions#create'

  get '/venues/:venue_id', to: 'venues#show', as: 'venue'
end
