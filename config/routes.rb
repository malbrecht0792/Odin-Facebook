Rails.application.routes.draw do

  devise_for :users
  #get 'sessions/new'
  #get 'sessions/destroy'

  root 'welcome#index'
  #get  '/signup',  to: 'devise/registration#new'
  #get  '/login',  to: 'sessions#new'
  #post  '/login',  to: 'sessions#new'
  #resources :users, :except => [:index]
  #resources :sessions, only: [:new, :create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
