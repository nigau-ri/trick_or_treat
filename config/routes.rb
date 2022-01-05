Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update] do
    resources :user_details, only: [:new, :create, :edit, :update]
  end
  resources :followings, only: [:index, :show, :create, :destroy] do
    collection do
      get 'search'
    end
    resources :following_tags, only: [:create]
  end
  resources :rooms do
    resources :room_details, only: [:new, :create, :edit, :update]
    resources :messages, only: [:create, :destroy]
    resources :goods, only: [:create, :destroy]
    member do
      get 'allow'
      post 'invite'
    end
  end
end
