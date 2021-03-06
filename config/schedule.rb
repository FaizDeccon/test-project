# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, '/path/to/my/cron_log.log'

every 1.hour do
  # command "echo 'Hi'"
  # runner "MyModel.some_method"
  rake 'stories:delete_1_day_old'
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
