Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  resources :products, only: :show do
    resources :reviews, only: [:create]
  end
  post   '/like/:product_id' => 'likes#create',   as: 'like_create'
  delete '/like/:product_id' => 'likes#destroy', as: 'like_destroy'
  root 'products#index'
end
