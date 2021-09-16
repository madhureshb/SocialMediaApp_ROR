Rails.application.routes.draw do
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'dashboard', to: 'accounts#index'
  root 'welcome#index'
  get 'my_friends', to: 'accounts#my_friends'
  get 'search_friend', to: 'accounts#search'
  resources :posts, only: [:new,:create,:show]
  resources :friendships, only: [:create, :destroy]
end
