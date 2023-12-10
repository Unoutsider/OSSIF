Rails.application.routes.draw do
  get 'tasks/react'
  get 'tasks/offer'
  get 'tasks/edit'
  get 'tasks/tasks_data'
  get 'tasks/test'
  get 'tasks/task'
  get 'tasks/offer_results'

  post 'tasks/offer_create', to: 'tasks#offer_create'
  post 'tasks/positive_offer', to: 'tasks#positive_offer'
  post 'tasks/negative_offer', to: 'tasks#negative_offer'
  post 'tasks/delete_task', to: 'tasks#delete_task'

  get 'users/create'
  get 'users/reset'
  get 'users/destroy'
  get 'users/new'

  get 'users/profile'
  get 'users/rating'
  get 'users/withdrawal'
  get 'users/users_data'

  get 'users/competition_speech'
  get 'users/competition_productivity'
  get 'users/competition_sleep'
  get 'users/competition_nutrition'

  post 'users/change_sphere', to: 'users#change_sphere'
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

  root 'main#input', as: 'home'

  resources :sessions
  resources :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
