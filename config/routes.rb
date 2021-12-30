Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users, only: [:show, :edit, :update] do
    resources :user_details, only: [:new, :create, :edit, :update]
  end
  resources :following, only: [:create, :destroy]
end
