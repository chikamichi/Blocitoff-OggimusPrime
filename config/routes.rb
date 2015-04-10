Blocitoff::Application.routes.draw do

  devise_for :users

  resources :users, only: [:show, :update] do
    resources :lists do
      resources :items
    end
  end

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  get 'welcome/index'

  root to: 'welcome#index'
end
