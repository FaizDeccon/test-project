# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id if user_signed_in?

    if @comment.save
      return_url = params[:comment][:return_to].present? ? post_path(@comment.post_id) : my_feed_path
      redirect_to return_url, flash: { success: 'Commented!' }
    else
      redirect_to my_feed_path, flash: { danger: 'Comment not published!' }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id, :return_to)
  end
end
