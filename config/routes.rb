Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: 'users', only: 'create'

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  get "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/home" => "sleep#home", as: "home"
  root "sleep#index"

  get '/user/:id', to: 'sleep#show', as: 'user_page'
  get '/user/:id/edit', to: 'sleep#edit', as: 'edit_user'
  post '/:id/edit', to: 'sleep#edit_user', as: 'edit_user_form'
  get '/user/:id/following', to: 'sleep#following', as: 'user_following'
  get '/user/:id/followers', to: 'sleep#followers', as: 'user_followers'
  post '/:user_id/follow', to: 'sleep#add_following', as: 'add_following'
  post '/:user_id/remove_follow', to: 'sleep#remove_following', as: 'remove_following'
  get 'user/:id/create', to: 'sleep#create', as: 'create'
  post 'user/:id/create', to: 'sleep#create', as: 'create_form'


  get '/sleepscape/:sleepscape_id/:user_id', to: 'sleep#sleepscape', as: 'sleepscape_page'
  post '/:sleepscape_id', to: 'sleep#like_sleepscape', as: 'like_sleepscape'
  post '/:user_id/remove_like', to: 'sleep#remove_like_sleepscape', as: 'remove_like_sleepscape'
  post '/comment/:sleepscape_id', to: 'sleep#create_comment', as: 'create_comment'
end
