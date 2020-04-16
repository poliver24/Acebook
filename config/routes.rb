Rails.application.routes.draw do

  mount ActionCable.server => '/cable'

  get 'chatroom/show'
  get 'users/0' => redirect('/')

  # resources :chatroom, only: [:show]

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  # get 'sessions/new'

  # get 'sessions/create'

  # get 'sessions/destroy'

  # get 'users/index'
  # get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts
  resources :users

  authenticated :user do
    root :to => "posts#index"
  end
  
  root :to => redirect("/users/sign_in")

  # resources :sessions, only: [:new, :create, :destroy]
  get "/:username" => "users#show"
  # get 'login', to: 'sessions#new', as: 'login'
  post '/users/find', to: 'users#find'

  # get 'logout', to: 'sessions#destroy'
  # get 'signup', to: 'users#new'
  # get 'delete', to: 'posts#destroy'

 
end
