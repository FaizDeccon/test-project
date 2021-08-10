# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader
  after_create :send_mail
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  def fullname
    "#{firstname} #{lastname}"
  end

  def total_followers
    Follower.where(following_id: id).count
  end

  def total_following
    Follower.where(follower_id: id).count
  end

  def self.text_search(query)
    if query.present?
      # where('username @@ :q or firstname @@ :q or lastname ilike :q', q: query)
      where('similarity(username, ?) > 0.3', query).order("similarity(username, #{ActiveRecord::Base.connection.quote(query)}) DESC")
      where('similarity(firstname, ?) > 0.3', query).order("similarity(firstname, #{ActiveRecord::Base.connection.quote(query)}) DESC")
      where('similarity(lastname, ?) > 0.3', query).order("similarity(lastname, #{ActiveRecord::Base.connection.quote(query)}) DESC")
    else
      all
    end
  end

  def send_mail
    UserMailer.with(user: @user).welcome_email.deliver_later
  end
end
