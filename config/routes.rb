Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  namespace :questions do
    resources :newest, only: :index
  end
  resources :questions, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :answers, only: [:new, :create, :show]
    resources :questions_users, only: :create
    resources :keeps, only: [:create, :destroy]
  end
  resources :tags, only: [:index, :show]
  get 'search' => 'home#search'
  root 'home#index'
end
