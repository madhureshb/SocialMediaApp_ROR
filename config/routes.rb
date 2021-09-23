Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'accounts#index'

  get 'dashboard', to: 'accounts#index'
  get 'my_friends', to: 'accounts#my_friends'
  get 'search_friend', to: 'accounts#search'

  resources :posts, only: [:new,:create,:show]
  resources :friendships, only: [:create, :destroy, :update]
  resources :comments, only: [:create]
  resources :likes, only: [:create, :destroy]
  resources :accounts, only: [:show]
end
