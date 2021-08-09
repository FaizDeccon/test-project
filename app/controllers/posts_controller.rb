# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def feed
    @posts = Post.all
    # @posts = Post.where(post_id: )
    @comment = Comment.new
    @following_ids = Follower.where(follower_id: current_user.id).map(&:following_id)
    @users = User.all
  end

  def new
    @post = current_user.posts.build
  end

  def show
    @comment = Comment.new
    @comments = @post.comments
  end

  def edit; end

  def update; end

  def destroy; end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to action: 'index', notice: 'Post successfully uploaded.' }
        format.json { render :index, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:avatar, :caption)
  end
end
