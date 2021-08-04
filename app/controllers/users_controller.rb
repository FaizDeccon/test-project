# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile_page
    @user = User.find(params[:user_id])
  end
end
