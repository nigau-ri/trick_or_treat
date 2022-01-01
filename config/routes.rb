Rails.application.routes.draw do
  root 'home#index'
  get 'home/show', to: 'home#show'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :user_details, only: [:new, :create, :edit, :update]
  end
  resources :followings, only: [:index, :show, :create, :destroy] do
    resources :following_tags, only: [:index, :create]
  end
  resources :rooms
end
