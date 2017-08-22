Rails.application.routes.draw do

  root 'users#show'

  devise_for :users, :controllers => { registrations: 'users/registrations' }
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :posts

end
