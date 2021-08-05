# frozen_string_literal: true

class Follower < ApplicationRecord
  belongs_to :user, optional: true
  validates :follower_id, uniqueness: {scope: :following_id}
end
