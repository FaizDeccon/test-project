# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments, only: [:create]
  get 'post/like/:post_id' => 'likes#save_like', :as => :like_post
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'posts#feed'
  get '/feed' => 'posts#feed', :as => :my_feed
  get '/users/profile_page' => 'users#profile_page', :as => :profile
  get '/users' => 'users#index', :as => :users
  resources :posts
end
