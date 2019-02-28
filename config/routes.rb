Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :products, only: :show do
    resources :reviews, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  root 'products#index'
end
