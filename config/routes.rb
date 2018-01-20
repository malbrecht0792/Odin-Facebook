Rails.application.routes.draw do
  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end
  root to: redirect('/users/sign_in')

  resources :welcome, only: [:index]
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: %i[index show edit update destroy]
  resources :posts
  resources :friend_requests, only: %i[index create update destroy] do
    collection do
      get 'random'
    end
  end
  resources :likes, only: %i[create destroy]
  resources :comments, only: %i[create destroy]
end
