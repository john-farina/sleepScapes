Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: 'users', only: 'create'

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end

  root "sleep#index"

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  get "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  get "/home" => "home_pages#home", as: "home"
  get "/sleepscapes" => "home_pages#sleep_home", as: 'sleepscapes_home'
  get "/studyscapes" => "home_pages#study_home", as: 'studyscapes_home'
  get "/distractionscapes" => "home_pages#distraction_home", as: 'distractionscapes_home'
  get "/curated" => "home_pages#curated_home", as: 'curated_home'
  get "/recent" => "home_pages#recent_soundscapes_home", as: "recent_soundscapes_home"
  get "/users" => "home_pages#users_home", as: 'users_home'

  get "/edit/:id" => "users#edit_user", as: 'edit_user'
  post "/edit/:user_id" => "users#edit_user_form", as: 'edit_user_form'

  get '/user/:id', to: 'users#show', as: 'user_page'
  get '/user/:id/following', to: 'users#following', as: 'user_following'
  get '/user/:id/followers', to: 'users#followers', as: 'user_followers'
  post '/:user_id/follow', to: 'users#add_following', as: 'add_following'
  post '/:user_id/remove_follow', to: 'users#remove_following', as: 'remove_following'


  # get '/secret/very/very/secret', to: 'sleep#secret_admin'
  post '/secret', to: 'soundscape#create_secret_admin', as: 'secret_admin'
  post '/admin_like', to: 'soundscape#admin_like', as: 'admin_like'
  post '/admin_dislike', to: 'soundscape#admin_dislike', as: 'admin_dislike'

  get '/user/:id/create', to: 'soundscape#create', as: 'create'
  post '/user/:id/create', to: 'soundscape#create', as: 'create_form'

  get '/sleepscape/:sleepscape_id/:user_id', to: 'soundscape#sleepscape', as: 'sleepscape_page'
  post '/:sleepscape_id', to: 'soundscape#like_sleepscape', as: 'like_sleepscape'
  post '/comment/:sleepscape_id', to: 'soundscape#create_comment', as: 'create_comment'
  post '/:user_id/remove_like', to: 'soundscape#remove_like_sleepscape', as: 'remove_like_sleepscape'
  post '/edit/soundscape/:id', to: 'soundscape#edit_soundscape', as: 'edit_soundscape'
  delete '/delete/soundscape/:id', to: 'soundscape#delete_soundscape', as: 'delete_soundscape'

  get "/testing", to: 'sleep#testing'
end
