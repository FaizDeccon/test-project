# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'faiz.ali@devsinc.com'
  layout 'mailer'
end
