# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id if user_signed_in?
    # @comment.save
    respond_to do |format|
      if @comment.save
        format.js { render layout: false }   # renders create.js.erb, which could be used to redirect via javascript
      else
        format.html { render :action => 'create' }
        format.js { render :action => 'create' }
      end
    end

    # if @comment.save
    #   return_url = params[:comment][:return_to].present? ? post_path(@comment.post_id) : my_feed_path
    #   redirect_to return_url, flash: { success: 'Commented!' }
    # else
    #   redirect_to my_feed_path, flash: { danger: 'Comment not published!' }
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
