Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show] do
    scope module: :users do
      resources :keeps, only: :index
    end
  end

  namespace :questions do
    resources :newest, only: :index
  end

  resources :questions, only: [:new, :create, :show, :destroy, :edit, :update] do
    resources :answers, only: [:new, :create, :show]
  end

  resources :tags, only: [:index, :show]

  get 'search' => 'home#search'

  root 'home#index'
end
