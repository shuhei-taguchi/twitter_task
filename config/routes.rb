Rails.application.routes.draw do
  get 'toppages/index'

  root to: 'toppages#index'
  root to: 'tasks#index'
  
  get 'microposts/create'
  get 'microposts/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new'

  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'

 resources :users, only: [:index, :show, :new, :create]
 resources :microposts, only: [:create, :destroy]
 resources :tasks
 end
