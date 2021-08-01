class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  belongs_to :user
  mount_uploaders :avatars, AvatarUploader

  def total_likes
    0
  end
end
