# frozen_string_literal: true

class Story < ApplicationRecord
  belongs_to :user, optional: true
  mount_uploader :avatar, AvatarUploader

  validates :avatar, presence: true
end
