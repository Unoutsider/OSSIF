Rails.application.routes.draw do

  get 'users/create'
  get 'users/reset'
  get 'users/destroy'
  get 'users/new'
  get 'users/show'
  get 'users/cash_check'

  get 'users/task'
  get 'users/profile'
  get 'users/rating'
  get 'users/test'

  get 'users/competition_speech'
  get 'users/competition_productivity'
  get 'users/competition_sleep'
  get 'users/competition_nutrition'

  get 'users/offer'
  get 'users/withdrawal'

  get 'users/users_data'
  get 'users/tasks_data'
  get 'users/edit'
  get 'users/react'

  post 'users/cash_check', to: 'users#cash_check'
  post 'users/new_password', to: 'users#new_password'
  post 'users/create', to: 'users#create'
  post 'users/destroy', to: 'users#destroy'

  get 'sessions/create'
  get 'sessions/destroy'
  get 'sessions/new'
  post 'sessions/create', to: 'sessions#create'
  post 'sessions/destroy', to: 'sessions#destroy'

  get 'main/input'
  get 'main/output'

  root 'main#input', as: 'home'

  resources :sessions
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
