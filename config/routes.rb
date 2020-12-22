Rails.application.routes.draw do
  devise_for :users
  root to: 'lists#index'

  resources :lists do
    member do
      patch :move
    end
  end

  resources :cards

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
