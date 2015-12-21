Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    scope module: :users do
      resources :keeps, only: :index
      resources :recents, only: :index
      resources :answered_questions, only: :index
    end
  end

  namespace :questions do
    resources :newest, only: :index
  end

  resources :questions, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :answers, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :questions_users, only: :create
    resources :keeps, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :tags, only: [:index, :show]

  get 'search' => 'home#search'

  root 'home#index'
end
