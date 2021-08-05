# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'faiz.ali@devsinc.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to My Blog App')
  end
end
