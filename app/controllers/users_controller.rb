# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile_page
    @user = User.find(params[:user_id])
  end

  def index
    # @users = User.where.not(id: current_user.id)
    @users = User.text_search(params[:query])
  end
end
