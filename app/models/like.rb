# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates :user_id, uniqueness: {scope: :post_id}

  after_create :increase_likes_counter
  after_destroy :decrease_likes_counter

  private

  def increase_likes_counter
    Post.find(self.post_id).increment(:total_likes).save
  end

  def decrease_likes_counter
    Post.find(self.post_id).decrement(:total_likes).save
  end
end
