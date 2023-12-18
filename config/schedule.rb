# frozen_string_literal: true

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

def schedule_send_email_task(environment)
  every(1.day, at: '10:00 am') do
    rake('reminder:send_confirmation_email', environment: environment)
  end
end

# Schedule for development environment
schedule_send_email_task('development')

# Schedule for production environment
schedule_send_email_task('production')

# Learn more: http://github.com/javan/whenever
