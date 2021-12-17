Rails.application.routes.draw do
  root 'home#index'

  get 'timeline/index'
  get 'timeline/mentions'
  post 'timeline/blipit', as: 'blipit'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
