# frozen_string_literal: true

class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploaders :avatars, AvatarUploader

  def total_likes
    0
  end

  def liked?(user)
    !!self.likes.find { |like| like.user_id == user.id }
  end
end
