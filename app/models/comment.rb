# frozen_string_literal: true

class Comment < ApplicationRecord
  default_scope { order created_at: :desc }
  belongs_to :post
  belongs_to :user

  validates :comment, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  attr_accessor :return_to
end
