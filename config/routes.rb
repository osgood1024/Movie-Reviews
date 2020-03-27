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

get 'movies/:id/reviews', to: 'reviews#new', as:"movie_review"
delete 'movies/:id/reviews',to: 'reviews#destroy'

get 'users/:id/watchlists', to: 'watchlists#new',as:"user_watchlist"
post 'users/:id/watchlists', to:'watchlists#create'
delete 'users/:id/watchlists', to: 'watchlists#destroy', as:"delete_watchlist"


end
