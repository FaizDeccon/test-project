# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.text_search(params[:query])
  end

  def profile_page
    @user = User.find(params[:user_id])
    @following_ids = Follower.where(follower_id: current_user.id).map(&:following_id)
  end

  def follow_user
    follower_id = params[:follow_id]
    Follower.create!(follower_id: current_user.id, following_id: follower_id)
    redirect_to profile_path(user_id: follower_id)
  end

  def unfollow_user
    follower_id = params[:follow_id]
    @follower = Follower.find_by(follower_id: current_user.id, following_id: follower_id)
    @follower.destroy
    redirect_to profile_path(user_id: follower_id)
  end
end
