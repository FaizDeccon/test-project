# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments, only: [:create, :index]
  get 'post/like/:post_id' => 'likes#save_like', :as => :like_post
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'posts#feed'
  get '/feed' => 'posts#feed', :as => :my_feed
  get '/users/profile_page' => 'users#profile_page', :as => :profile
  get '/users' => 'users#index', :as => :users
  post 'follow/user' => 'users#follow_user', :as => :follow_user
  post 'unfollow/user' => 'users#unfollow_user', :as => :unfollow_user
  resources :posts
  resources :stories
end
