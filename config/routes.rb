Blocitoff::Application.routes.draw do

  get 'items/new'

  devise_for :users

  resources :users, only: [:update, :show] do
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
