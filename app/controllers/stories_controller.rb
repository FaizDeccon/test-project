# frozen_string_literal: true

class StoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_story, only: %i[destroy]

  def index
    @stories = Story.all
  end

  def new
    @story = current_user.stories.build
  end

  def show
    @stories = Story.where(user_id: params[:id])
  end

  def destroy; end

  def create
    @story = current_user.stories.build(story_params)

    respond_to do |format|
      if @story.save
        format.html { redirect_to '/feed' }
        format.json { render :index, status: :created, location: @story }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_story
    @story = Story.find(params[:id])
  end

  def story_params
    params.require(:story).permit(:avatar)
  end
end
