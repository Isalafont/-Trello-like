# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  mount ActionCable.server => '/cable'

  root to: 'pages#home'

  resources :lists do
    member do
      patch :move
    end
  end

  resources :cards do
    member do
      post :attach
      patch :move
    end
  end

  resources :profiles, only: [:show, :new, :create, :edit, :update]
end
