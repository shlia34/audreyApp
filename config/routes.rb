Rails.application.routes.draw do

  devise_for :users
  resources :users, only: :show
  resources :products, only: :show do
    resources :reviews, only: [:create]
  end
  root 'products#index'
end
