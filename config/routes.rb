# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments, only: [:create]
  get 'post/like/:post_id' => 'likes#save_like', :as => :like_post
  # get 'post/:id/unlike' => 'posts#unlike', as: :unlike
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#feed'
  get '/feed' => 'posts#feed', :as => :my_feed
  get '/users/profile_page' => 'users#profile_page', :as => :profile
  resources :posts
end
