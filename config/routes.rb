Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to =>"homes#top"
  devise_for :users
  get "home/about"=>"homes#about"

  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
  #いいね機能のルーティング
  resource :favorites, only: [:create, :destroy]
  #コメント機能のルーティング
  resources :book_comments, only: [:create, :destroy]
  end
  #フォロー機能のルーティング
  resources :users, only: [:show] do
    member do
      get :following, :followers
    end
  end
  
  resources :users, only: [:index, :show, :edit, :update]
  #フォロー機能のルーティング
  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end