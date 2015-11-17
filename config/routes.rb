Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, only: [:show]
  resources :questions, only: [:new, :create, :show] do
    resources :answers, only: [:new, :create, :show]
  end
  resources :tags, only: [:index]
end
