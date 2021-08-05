# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_like, only: [:save_like]

  def save_like
    respond_to do |format|
      format.js do
        if @pre_like.any?
          @pre_like.first.destroy
          @success = false
        elsif @like.save
          @success = true
        else
          @success = false
        end
        @post_likes = Post.find(@post_id).total_likes
        render 'posts/like'
      end
    end
  end

  private

  def set_like
    @post_id = params[:post_id]
    @like = Like.new(post_id: @post_id, user_id: current_user.id)
    @pre_like = Like.where(post_id: @post_id, user_id: current_user.id)
  end
end
