# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :comment, presence: true
  validates :user_id, presence: true
  validates :post_id, presence: true

  attr_accessor :return_to
end
