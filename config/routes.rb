Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
  resources :products, only: :show do
    resources :reviews, only: [:create]
  end
  post   '/like/:product_id' => 'likes#create',   as: 'like_create'
  delete '/like/:product_id' => 'likes#destroy', as: 'like_destroy'
  root 'products#index'
end
