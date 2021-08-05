# frozen_string_literal: true

namespace :stories do
  desc 'delete_stories_after_one_day'
  task delete_1_day_old: :environment do
    Story.where(['created_at < ?', 1.day.ago]).destroy_all
  end
end
