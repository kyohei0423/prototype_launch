Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  resources :questions, only: [:new, :create, :show] do
    resources :answers, only: [:new, :create, :show]
  end

  resources :tags, only: [:index, :show]

  namespace :api do
    resources :questions do
      collection do
        get 'newest'
        get 'popular'
        get 'easier'
      end
    end
  end

  root 'home#index'
end
