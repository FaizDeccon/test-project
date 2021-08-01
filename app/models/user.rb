class User < ApplicationRecord
  has_many :posts
  mount_uploader :avatar, AvatarUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  ,:confirmable, :lockable
  def fullname
    "#{firstname} #{lastname}"
  end

  def total_followers
    0
  end

  def total_following
    0
  end
end
