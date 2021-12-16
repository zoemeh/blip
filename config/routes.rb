Rails.application.routes.draw do
  get 'timeline/index'
  get 'timeline/mentions'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'home/index'
  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
