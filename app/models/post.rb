# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

  validates :avatar, presence: true

  def liked?(user)
    !!likes.find { |like| like.user_id == user.id }
  end
end
