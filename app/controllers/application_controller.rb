# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :null_session

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :firstname, :lastname, :username, :password) }

    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :firstname, :lastname, :avatar, :phone, :bio, :email, :password, :current_password) }
  end
end
