Rails.application.routes.draw do

  root 'users#show'

  devise_for :users, :controllers => { registrations: 'users/registrations', 
  									   :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :posts
  resources :friend_requests, only: [:index, :create, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]

end
