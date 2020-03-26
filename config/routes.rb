Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :users, :watchlists
resources :movies, only: [:index, :show]
resources :reviews
# resources :sessions, only: [:new, :create, :destroy]

# get '/sessions', to:"users#create", as: "sign_up"
get 'sessions/new', to: 'sessions#new', as: "new_login"
post 'sessions', to: 'sessions#create', as: "login"
delete 'sessions',  to: 'sessions#destroy', as: "destroy_session"

end
