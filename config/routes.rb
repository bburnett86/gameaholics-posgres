Rails.application.routes.draw do

  root to: 'welcome#index'

  get '/login' => 'session#new'
  post '/login' => 'session#login'
  get '/logout' => 'session#logout'

  get '/register' => 'session#register'

  post '/register' => 'users#create'

  get '/comments/:id/upvote' => 'comments#upvote'

  get '/comments/:id/downvote' => 'comments#downvote'

  get '/users/:username/games/:game_name/add' => 'games#owned'

  get '/games/:game_name/rate/:rate_value' => 'games#rate_game'

  resources :users, only: [:new, :create]

  resources :games, only: [:new, :create]

  # resources :games, only: [:show, :edit, :update, :destroy], param: :game_name

  resources :games, only: [:show, :edit, :update, :destroy], param: :game_name do
    resources :ratings, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update, :destroy], param: :username

  resources :tags, only: [:new, :create,]

  resources :tags, only: [:new, :create, :index]

  resources :tags, only: [:show], param: :tag_name

  resources :comments, only: [:new, :create, :destroy]

end

