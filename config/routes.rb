# frozen_string_literal: true

Rails.application.routes.draw do
  get 'post/:id/like' => 'posts#like', as: :like
  get 'post/:id/unlike' => 'posts#unlike', as: :unlike
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#feed'
  get '/feed' => 'posts#feed', :as => :my_feed
  resources :posts
end
