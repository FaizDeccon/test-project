class User < ApplicationRecord
  has_many :posts
  has_one :image, as: :imageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        #  ,:confirmable, :lockable
end
