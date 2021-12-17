Rails.application.routes.draw do
  get 'profile/:username', to: 'profile#index', as: 'profile'
  get 'profile/:username/followers', to: 'profile#followers', as: 'followers'
  get 'profile/:username/following', to: 'profile#following', as: 'following'

  get 'timeline/index', as: 'timeline'
  get 'timeline/mentions', as:  "mentions"
  post 'timeline/blipit', as: 'blipit'
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'home#index'
end
