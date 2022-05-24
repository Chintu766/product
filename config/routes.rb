# frozen_string_literal: true

Rails.application.routes.draw do
  resources :images
  resources :likes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  resources :articles do
    get 'liked_article', on: :member
    post 'liked_article', on: :member
    # post 'shared_article', on: :member
  end
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  resources :users, except: [:new]
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'search', to: 'articles#search'
  resources :favourites do
    get 'fav', on: :member
    post 'fav', on: :member
  end
  resources :shares do
    get 'share', on: :member
    post 'share', on: :member
  end
end
