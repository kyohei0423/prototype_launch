Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show]

  namespace :questions do
    resources :newest, only: :index
  end

  resources :questions, only: [:new, :create, :show] do
    resources :answers, only: [:new, :create, :show]
    resources :comments, only: [:create, :destory, :update]
  end


  resources :tags, only: [:index, :show]

  get 'search' => 'home#search'

  root 'home#index'
end
