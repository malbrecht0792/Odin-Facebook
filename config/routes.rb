Rails.application.routes.draw do

  #root 'welcome#index'
  root 'users#show'

  devise_for :users
  resources :users, only: [:show, :edit, :update]

end
