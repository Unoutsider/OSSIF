Rails.application.routes.draw do
  get 'users/create'
  get 'users/destroy'
  get 'users/new'
  get 'users/show'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'sessions/new'
  get 'main/input'
  get 'main/output'

  root 'main#input', as: 'home'
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
