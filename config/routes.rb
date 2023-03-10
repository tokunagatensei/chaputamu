Rails.application.routes.draw do
  get 'messages/index'
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:show, :edit, :update]
  resources :rooms, only: [:index, :new, :create] do
    resources :messages, only: [:index, :create]
  end
end
